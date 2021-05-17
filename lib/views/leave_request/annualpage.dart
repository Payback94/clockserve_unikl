import 'package:flutter/material.dart';

class AnnualRequest extends StatefulWidget {
  @override
  _AnnualRequestState createState() => _AnnualRequestState();
}

class _AnnualRequestState extends State<AnnualRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Annual Leave Request'),
      ),
      body: Stack(),
    );
  }
}
