import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emp = Provider.of<Employee_Provider>(context).emp;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 250,
            color: Colors.amber,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Container(
                        child: Image.asset('lib/assets/img/user.png'),
                      ),
                    ),
                    Container(
                      width: 280,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(emp.empFirstName.toUpperCase() ?? 'first name'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(emp.empLastName.toUpperCase() ?? 'last name'),
                          Spacer(),
                          Text(emp.empGender.toUpperCase() ?? 'gender'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 280,
                      height: 60,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text('Date of Birth'),
                              Spacer(),
                              Text(emp.empBirthDate)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 60,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text('Email'),
                              Spacer(),
                              Text(emp.empEmail)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 60,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text('Race'),
                              Spacer(),
                              Text(emp.empRace.toUpperCase())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
