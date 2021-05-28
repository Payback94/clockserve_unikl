import 'package:clockserve_unikl/models/leave_requests.dart';
import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:clockserve_unikl/services/request_serv.dart';
import 'package:clockserve_unikl/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emp = Provider.of<Employee_Provider>(context).emp;
    final RequestServe rqServe = RequestServe();
    return Scaffold(
        appBar: AppBar(
          title: Text('Leave Request List'),
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
            future: rqServe.getEmpRequest(emp.empId),
            builder: (BuildContext context,
                AsyncSnapshot<List<Leaverequest>> snapshot) {
              if (snapshot.hasData) {
                List<Leaverequest> attList = snapshot.data;
                return Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      color: Colors.amber,
                    ),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 50, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'LEAVE REQUEST LIST',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Here is the list of your request history.',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                        Expanded(
                          child: ListView(
                            children: attList
                                .map((Leaverequest attList) => Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Card(
                                            elevation: 20.0,
                                            child: Container(
                                              padding: EdgeInsets.all(15),
                                              child: Row(
                                                children: <Widget>[
                                                  Column(
                                                    children: <Widget>[
                                                      Text('Ticket ID'),
                                                      Text(attList.requestId),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text('Leave Reason'),
                                                        Text(
                                                          '${attList.requestReason}',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text('Status'),
                                                        if (attList
                                                                .requestApproval ==
                                                            'APPROVED')
                                                          Text(
                                                            '${attList.requestApproval}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green),
                                                          )
                                                        else if (attList
                                                                .requestApproval ==
                                                            'PENDING')
                                                          Text(
                                                            '${attList.requestApproval}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .amber),
                                                          )
                                                        else if (attList
                                                                .requestApproval ==
                                                            'DENIED')
                                                          Text(
                                                            '${attList.requestApproval}',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Text('Date Leave'),
                                                      Text(
                                                          '${attList.dateLeave.day}-${attList.dateLeave.month}-${attList.dateLeave.year}'),
                                                      Text('Date Return'),
                                                      Text(
                                                          '${attList.dateReturn.day}-${attList.dateReturn.month}-${attList.dateReturn.year}')
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                    // ListTile(
                                    //   title: Text(attList.LeaverequestDay),
                                    //   subtitle: Text(
                                    //       '${attList.LeaverequestDate.day}-${attList.LeaverequestDate.month}-${attList.LeaverequestDate.year}'),
                                    // ),
                                    )
                                .toList(),
                          ),
                        ),
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
}
