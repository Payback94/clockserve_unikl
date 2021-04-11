import 'package:flutter/material.dart';

const decorationBox = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2.0)),
);
