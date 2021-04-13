import 'package:clockserve_unikl/models/employee.dart';
import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:clockserve_unikl/views/qr_scanner/attendance_Scan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final Employee emp;

  const HomePage({Key key, this.emp}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //to do: add back end
  //use futurebuilder to return user object
  //using futureprovider to get snapshot data of user object from database
  @override
  Widget build(BuildContext context) {
    final emp = Provider.of<Employee_Provider>(context).emp;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () async {
              Employee_preferences().removeEmployee();
              Navigator.pushReplacementNamed(context, '/authenticate');
            },
            label: Text(
              'Log Out',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
        title: Text('ClockServe'),
        centerTitle: true,
      ),
      //button to pop qr scanner camera
      //after scanning a qr code it should parse the json array
      //into a method, the method will take that as parameter.
      //method should send http request check in the auth dart
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Check In'),
        icon: Icon(Icons.camera_alt),
        onPressed: () => navigateToScanPage(context),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.alarm_on),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(emp.empFirstName ?? 'emp first name'),
            ],
          ),
        ),
      ),
    );
  }
}

Future navigateToScanPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AttendanceScanner()));
}
