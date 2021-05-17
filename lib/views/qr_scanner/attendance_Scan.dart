import 'dart:convert';

import 'package:clockserve_unikl/services/attendance_serv.dart';
import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class AttendanceScanner extends StatefulWidget {
  @override
  _AttendanceScannerState createState() => _AttendanceScannerState();
}

class _AttendanceScannerState extends State<AttendanceScanner> {
  bool clockedIn = false;
  bool lunch = false;
  bool clockedOut = true;
  String clockStats = "Clocked Out";
  @override
  Widget build(BuildContext context) {
    Future _scan() async {
      await Permission.camera.request();
      String barcode = await scanner.scan();
      if (barcode == null) {
        print('nothing return.');
      } else {
        return barcode;
      }
    }

    AttendanceServ attServ = new AttendanceServ();
    final emp = Provider.of<Employee_Provider>(context).emp;
    DateTime dt = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Scanner'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WELCOME ${emp.empFirstName.toUpperCase()}',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'TODAY IS ${dt.day}-${dt.month}-${dt.year}',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      'CURRENT TIME ${dt.hour}:${dt.minute}:${dt.second}',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Text(
                          'Attendance Status: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '${clockStats}',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: clockedIn
                          ? null
                          : () async {
                              if (lunch == false) {
                                var resultScan = await _scan();
                                final Map<String, dynamic> jsonConvert =
                                    jsonDecode(resultScan);
                                String attStr = jsonConvert['session_id'];
                                var rDate = DateTime.parse(jsonConvert['date']);
                                attServ.timeIn(emp.empId, attStr, rDate);
                                setState(() {
                                  clockedIn = true;
                                  clockedOut = false;
                                  clockStats = "Clocked In";
                                });
                              } else {
                                DateTime rDate = DateTime.now();
                                attServ.lunchIn(emp.empId, rDate);
                                setState(() {
                                  clockedIn = true;
                                  clockedOut = false;
                                  clockStats = "Clocked In";
                                });
                              }
                            },
                      child: Text('Scan')),
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: clockedOut
                              ? MaterialStateProperty.all<Color>(Colors.amber)
                              : MaterialStateProperty.all<Color>(Colors.red)),
                      onPressed: clockedOut
                          ? null
                          : () async {
                              if (lunch == false) {
                                DateTime currentDate = DateTime.now();
                                attServ.lunchOut(emp.empId, currentDate);
                                setState(() {
                                  clockedIn = false;
                                  clockedOut = true;
                                  lunch = true;
                                  clockStats = "Clocked Out";
                                });
                              } else {
                                DateTime currentDate = DateTime.now();
                                attServ.timeOut(emp.empId, currentDate);
                                setState(() {
                                  clockedIn = false;
                                  clockedOut = true;
                                  lunch = false;
                                  clockStats = "Clocked Out";
                                });
                              }
                            },
                      child: Text(clockedIn ? 'Clock Out' : 'Clocked Out')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
