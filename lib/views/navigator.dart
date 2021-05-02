import 'package:clockserve_unikl/models/employee.dart';
import 'package:clockserve_unikl/views/leave_request/leave_main.dart';
import 'package:clockserve_unikl/views/report/report_list.dart';
import 'package:flutter/material.dart';
import 'package:clockserve_unikl/views/user/homepage.dart';

class NavigatorPage extends StatefulWidget {
  final Employee emp;
  const NavigatorPage({Key key, this.emp}) : super(key: key);
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Center(child: HomePage()),
      Center(child: ReportListPage()),
      Center(child: LeaveMainPage()),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), label: 'Report'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cake_outlined), label: 'Leave Request'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: tabs[_currentIndex],
    );
  }
}
