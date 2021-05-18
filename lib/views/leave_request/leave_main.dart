import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:clockserve_unikl/views/leave_request/medicalpage.dart';
import 'package:flutter/material.dart';

class LeaveMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Leave Request Page'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.amber,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text('Make a request here'),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 80,
                      width: 300,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Image.asset('lib/assets/img/leave.png'),
                                Spacer(),
                                Text('All Requests')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 300,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MedicalPage()));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Image.asset('lib/assets/img/fever.png'),
                                Spacer(),
                                Text('Medical Leave')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 300,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Image.asset('lib/assets/img/airplane.png'),
                                Spacer(),
                                Text('Annual Leave')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 300,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Image.asset('lib/assets/img/alarm.png'),
                                Spacer(),
                                Text('Emergency Leave')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
