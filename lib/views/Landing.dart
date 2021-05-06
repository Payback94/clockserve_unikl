import 'package:clockserve_unikl/models/employee.dart';
import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:clockserve_unikl/services/auth.dart';
import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:clockserve_unikl/views/navigator.dart';
import 'package:clockserve_unikl/views/qr_scanner/attendance_Scan.dart';
import 'package:clockserve_unikl/views/user/authenticate.dart';
import 'package:clockserve_unikl/views/user/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  //AuthService auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    Future<Employee> getuserdata() => Employee_preferences().getEmployee();
    return MultiProvider(
      providers: [
        Provider<Employee>(
          create: (_) => Employee(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => Employee_Provider(),
        ),
      ],
      child: MaterialApp(
        title: 'ClockServe',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: FutureBuilder(
            future: getuserdata(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return Text('Error:${snapshot.error}');
                  } else if (snapshot.data == null) {
                    return AuthenticatePage();
                  } else {
                    Provider.of<Employee_Provider>(context)
                        .setEmp(snapshot.data);
                    return HomePage(emp: snapshot.data);
                  }
              }
            }),
        routes: {
          '/navigatorPage': (context) => NavigatorPage(),
          '/homePage': (context) => HomePage(),
          '/authenticate': (context) => AuthenticatePage(),
          '/attendancePage': (context) => AttendanceScanner()
        },
      ),
    );
  }
}
