import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:clockserve_unikl/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final _formKey = GlobalKey<FormState>();
  String first_name = '';
  String last_name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    final emp = Provider.of<Employee_Provider>(context).emp;
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Leave'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 250,
            color: Colors.amber,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Fill the Form Below and Press Send:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 300,
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (value) =>
                                    value.isEmpty ? 'Enter email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                decoration:
                                    decorationBox.copyWith(hintText: 'Email'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      validator: (value) => value.isEmpty
                                          ? 'Enter First Name'
                                          : null,
                                      onChanged: (val) {},
                                      decoration: decorationBox.copyWith(
                                          hintText: 'First Name'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      validator: (value) => value.isEmpty
                                          ? 'Enter Last Name'
                                          : null,
                                      onChanged: (val) {},
                                      decoration: decorationBox.copyWith(
                                          hintText: 'Last Name'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(),
                              TextFormField(
                                decoration: decorationBox.copyWith(
                                    hintText: 'Leave Date'),
                                onTap: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2018, 3, 5),
                                      maxTime: DateTime(2030, 6, 7),
                                      onChanged: (date) {},
                                      onConfirm: (date) {});
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
