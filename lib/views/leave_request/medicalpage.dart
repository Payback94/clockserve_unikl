import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:clockserve_unikl/shared/styles.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:provider/provider.dart';
import 'package:clockserve_unikl/services/request_serv.dart';

class MedicalPage extends StatefulWidget {
  @override
  _MedicalPageState createState() => _MedicalPageState();
}

class _MedicalPageState extends State<MedicalPage> {
  bool success = true;
  bool failed = true;
  RequestServe rs = new RequestServe();
  final format = DateFormat('yyyy-MM-dd');
  final _formKey = GlobalKey<FormState>();
  double styleHeight = 10.0;
  String reasons = '';

  DateTime leaveDate;
  DateTime returnDate;
  @override
  Widget build(BuildContext context) {
    final emp = Provider.of<Employee_Provider>(context).emp;
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Medical Leave'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.amber,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                      child: Text(
                        'MEDICAL REQUEST',
                        style: TextStyle(fontSize: 24),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: success
                                  ? Card()
                                  : Card(
                                      child: Container(
                                          color: Colors.green,
                                          width: 300,
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: Text(
                                              'Successfully Submitted Request',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ),
                            ),
                            Container(
                              child: failed
                                  ? Card()
                                  : Card(
                                      child: Container(
                                          color: Colors.red,
                                          width: 300,
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: Text(
                                              'Unable to Submit Request',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ),
                            ),
                            Text('Employee Detail'),
                            SizedBox(
                              height: styleHeight,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  readOnly: true,
                                  initialValue: emp.empFirstName.toUpperCase(),
                                  validator: (value) =>
                                      value.isEmpty ? 'Enter First Name' : null,
                                  decoration:
                                      decorationBox.copyWith(hintText: 'Bleh'),
                                )),
                                SizedBox(
                                  width: styleHeight,
                                ),
                                Expanded(
                                    child: TextFormField(
                                  readOnly: true,
                                  initialValue: emp.empLastName.toUpperCase(),
                                  validator: (value) =>
                                      value.isEmpty ? 'Enter Last Name' : null,
                                  decoration:
                                      decorationBox.copyWith(hintText: 'Bleh'),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: styleHeight,
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: emp.empEmail,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter email' : null,
                              decoration:
                                  decorationBox.copyWith(hintText: 'Email'),
                            ),
                            SizedBox(
                              height: styleHeight,
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: emp.empGender.toUpperCase(),
                              validator: (value) =>
                                  value.isEmpty ? 'Enter gender' : null,
                              decoration:
                                  decorationBox.copyWith(hintText: 'Gender'),
                            ),
                            SizedBox(
                              height: styleHeight,
                            ),
                            Text('Leave Detail'),
                            SizedBox(
                              height: styleHeight,
                            ),
                            TextFormField(
                              validator: (value) =>
                                  value.isEmpty ? 'Enter Leave Reason' : null,
                              onChanged: (val) {
                                setState(() => reasons = val);
                              },
                              minLines: 3,
                              maxLines: 5,
                              decoration: decorationBox.copyWith(
                                  hintText: 'Reason For Leave'),
                            ),
                            SizedBox(
                              height: styleHeight,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DateTimePicker(
                                    validator: (value) => value.isEmpty
                                        ? 'Enter Leave Date'
                                        : null,
                                    decoration: decorationBox.copyWith(
                                        hintText: 'Leave Date'),
                                    initialValue: '',
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2050),
                                    dateLabelText: 'Leave Date',
                                    onChanged: (val) {
                                      setState(() =>
                                          leaveDate = DateTime.parse(val));
                                      print(leaveDate);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: styleHeight,
                                ),
                                Expanded(
                                    child: DateTimePicker(
                                  validator: (value) => value.isEmpty
                                      ? 'Enter Return Date'
                                      : null,
                                  decoration: decorationBox.copyWith(
                                      hintText: 'Return Date'),
                                  initialValue: '',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050),
                                  dateLabelText: 'Return Date',
                                  onChanged: (val) {
                                    setState(
                                        () => returnDate = DateTime.parse(val));
                                    print(returnDate);
                                  },
                                )),
                              ],
                            ),
                            SizedBox(
                              height: styleHeight,
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                child: Text('Send'),
                                onPressed: () async {
                                  final form = _formKey.currentState;
                                  if (form.validate()) {
                                    await rs.submitMedical(emp.empId, reasons,
                                        leaveDate, returnDate);
                                    setState(() {
                                      success = !success;
                                    });
                                  } else {
                                    setState(() {
                                      failed = !failed;
                                    });
                                    throw 'Unable to submit';
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
