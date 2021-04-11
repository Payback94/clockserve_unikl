import 'dart:io';
import 'package:clockserve_unikl/views/Landing.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClockServe',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Landing(),
    );
  }
}
