import 'package:clockserve_unikl/models/attendance.dart';
import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:clockserve_unikl/services/attendance_serv.dart';
import 'package:clockserve_unikl/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emp = Provider.of<Employee_Provider>(context).emp;
    final AttendanceServ attServe = AttendanceServ();
    return Scaffold(
        appBar: AppBar(
          title: Text('Attendance List'),
          centerTitle: true,
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
        ),
        body: FutureBuilder(
            future: attServe.getEmpAttendance(emp.empId),
            builder: (BuildContext context,
                AsyncSnapshot<List<Attendance>> snapshot) {
              if (snapshot.hasData) {
                List<Attendance> attList = snapshot.data;
                return Stack(
                  children: <Widget>[
                    Container(
                      height: 200,
                      color: Colors.amber,
                    ),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ATTENDANCE LIST',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Here is the list of your attendance history.',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                        listAttendance(attList),
                      ],
                    )
                  ],
                );
              } else {
                print(snapshot);
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Expanded listAttendance(List<Attendance> attList) {
    return Expanded(
      child: ListView(
        children: attList
            .map((Attendance attList) => Container(
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(attList.attendanceDay),
                                  Text(
                                      '${attList.attendanceDate.day}-${attList.attendanceDate.month}-${attList.attendanceDate.year}')
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Time In'),
                                  Text('${attList.attendanceTimeIn}')
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Lunch Out'),
                                  Text('${attList.lunch_out}')
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Lunch In'),
                                  Text('${attList.lunch_in}')
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Time Out'),
                                  Text('${attList.attendanceTimeOut}')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                // ListTile(
                //   title: Text(attList.attendanceDay),
                //   subtitle: Text(
                //       '${attList.attendanceDate.day}-${attList.attendanceDate.month}-${attList.attendanceDate.year}'),
                // ),
                )
            .toList(),
      ),
    );
  }
}
