import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:flutter/material.dart';

class ReportListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: <Widget>[
                Text(
                  'Daily Attendance',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                CardList(),
                Divider(
                  height: 15,
                ),
                Text(
                  'Attendance History',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                CardList(),
                SizedBox(
                  height: 10,
                ),
                CardList(),
                SizedBox(
                  height: 10,
                ),
                CardList(),
                SizedBox(
                  height: 10,
                ),
                CardList(),
              ],
            ),
          ),
        ));
  }
}

class CardList extends StatelessWidget {
  const CardList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Text('Attendance'),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('attendance.Day'),
                  Text('attendance.Date'),
                  Text('attendance.Status'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyCard extends StatelessWidget {
  const DailyCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Text('Attendance'),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('attendance.Day'),
                  Text('attendance.Date'),
                  Text('attendance.Status'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
