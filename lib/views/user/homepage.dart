import 'package:clockserve_unikl/models/employee.dart';
import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clockserve_unikl/views/leave_request/leave_main.dart';
import 'package:clockserve_unikl/views/qr_scanner/attendance_Scan.dart';
import 'package:clockserve_unikl/views/report/report_list.dart';
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
    Provider.of<Employee_Provider>(context).setEmp(widget.emp);
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

        body: Stack(
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.amber,
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Card(
                        child: Container(
                          height: 110,
                          padding: EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    height: 60,
                                    width: 60,
                                    child:
                                        Image.asset('lib/assets/img/user.png'),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        widget.emp.empFirstName.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.emp.empLastName.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(widget.emp.empEmail.toUpperCase()),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(widget.emp.empBirthDate),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(widget.emp.empRace.toUpperCase()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Text('Department of IT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ))
                        ],
                      ),
                    ),
                    HomePageBody(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        runSpacing: 20,
        spacing: 45,
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            child: Card(
              shadowColor: Colors.black,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReportListPage()));
                },
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'lib/assets/img/history.png',
                      cacheHeight: 80,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Attendance History')
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 150,
            child: Card(
              shadowColor: Colors.black,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LeaveMainPage()));
                },
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      'lib/assets/img/leave.png',
                      cacheHeight: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Leave Request'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 150,
            child: Card(
              shadowColor: Colors.black,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttendanceScanner()));
                },
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'lib/assets/img/record.png',
                      cacheHeight: 80,
                    ),
                    TextButton(onPressed: () {}, child: Text('Profile'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future navigateToScanPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AttendanceScanner()));
}
