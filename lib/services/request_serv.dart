import 'dart:async';
import 'dart:convert';

import 'package:clockserve_unikl/models/leave_requests.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class RequestServe {
  Future<Leaverequest> submitMedical(
      int empId, String reason, DateTime leaveDate, DateTime returnDate) async {
    final dateOnly = new DateFormat('yyyy-MM-dd');

    Response response = await post(
      Uri.parse('https://192.168.0.156/ClockServe_app/api/request/create.php'),
      body: jsonEncode({
        "emp_id": empId,
        "request_type": "Medical",
        "request_reason": reason,
        "date_leave": dateOnly.format(leaveDate),
        "date_return": dateOnly.format(returnDate)
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Leaverequest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to clock in');
    }
  }

  Future<Leaverequest> submitAnnual(
      int empId, String reason, DateTime leaveDate, DateTime returnDate) async {
    final dateOnly = new DateFormat('yyyy-MM-dd');
    final timeFormat = new DateFormat('hh:mm:ss');
    final dayName = new DateFormat('EEEE');

    Response response = await post(
      Uri.parse('https://192.168.0.156/ClockServe_app/api/request/create.php'),
      body: jsonEncode({
        "emp_id": empId,
        "request_type": "Annual",
        "request_reason": reason,
        "date_leave": dateOnly.format(leaveDate),
        "date_return": dateOnly.format(returnDate)
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Leaverequest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to clock in');
    }
  }

  Future<Leaverequest> submitEmergency(
      int empId, String reason, DateTime leaveDate, DateTime returnDate) async {
    final dateOnly = new DateFormat('yyyy-MM-dd');
    final timeFormat = new DateFormat('hh:mm:ss');
    final dayName = new DateFormat('EEEE');

    Response response = await post(
      Uri.parse('https://192.168.0.156/ClockServe_app/api/request/create.php'),
      body: jsonEncode({
        "emp_id": empId,
        "request_type": "Emergency",
        "request_reason": reason,
        "date_leave": dateOnly.format(leaveDate),
        "date_return": dateOnly.format(returnDate)
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Leaverequest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to clock in');
    }
  }
}
