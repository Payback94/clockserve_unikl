import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:clockserve_unikl/models/attendance.dart';
import 'package:http/http.dart';

class AttendanceServ {
  Future<Attendance> timeIn(int empId, String attString, DateTime date) async {
    final dateOnly = new DateFormat('yyyy-MM-dd');
    final timeFormat = new DateFormat('hh:mm:ss');
    final dayName = new DateFormat('EEEE');

    Response response = await post(
      Uri.parse(
          'https://192.168.0.171/ClockServe_app/api/attendance/timeIn.php'),
      body: jsonEncode({
        "emp_id": empId,
        "attendance_string": attString,
        "attendance_day": dayName.format(date),
        "attendance_date": dateOnly.format(date),
        "attendance_timeIn": timeFormat.format(date)
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Attendance.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to clock in');
    }
  }

  Future<Attendance> timeOut(int empId, String attString, DateTime date) async {
    final dateOnly = new DateFormat('yyyy-MM-dd');
    final timeFormat = new DateFormat('hh:mm:ss');
    final dayName = new DateFormat('EEEE');

    Response response = await put(
      Uri.parse(
          'https://192.168.0.171/ClockServe_app/api/attendance/timeOut.php'),
      body: jsonEncode({
        "emp_id": empId,
        "attendance_string": attString,
        "attendance_day": dayName.format(date),
        "attendance_date": dateOnly.format(date),
        "attendance_timeIn": timeFormat.format(date)
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Attendance.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to clock in');
    }
  }

  Future<List<Attendance>> getEmpAttendance(int id) async {
    Response response = await get(Uri.parse(
        'https://192.168.0.171/ClockServe_app/api/attendance/read_all_emp.php?emp_id=$id'));
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> body = jsonDecode(response.body)['data'];
      List<Attendance> att = body
          .map(
            (dynamic item) => Attendance.fromJson(item),
          )
          .toList();
      return att;
    } else {
      throw "Unable to read attendance";
    }
  }
}
