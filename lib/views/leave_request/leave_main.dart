import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:flutter/material.dart';

class LeaveMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Leave Request Page'),
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
    );
  }
}
