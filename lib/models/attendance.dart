// To parse this JSON data, do
//
//     final attendance = attendanceFromJson(jsonString);

import 'dart:convert';

Attendance attendanceFromJson(String str) =>
    Attendance.fromJson(json.decode(str));

String attendanceToJson(Attendance data) => json.encode(data.toJson());

class Attendance {
  Attendance({
    this.attendanceId,
    this.attendanceString,
    this.empId,
    this.attendanceDay,
    this.attendanceDate,
    this.attendanceTimeIn,
    this.lunch_out,
    this.lunch_in,
    this.attendanceTimeOut,
  });

  String attendanceId;
  String attendanceString;
  String empId;
  String attendanceDay;
  DateTime attendanceDate;
  String attendanceTimeIn;
  String attendanceTimeOut;
  String lunch_out;
  String lunch_in;

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      attendanceString: json["session_id"],
      empId: json["emp_id"],
      attendanceDay: json["attendance_day"],
      attendanceDate: DateTime.parse(json["attendance_date"]),
      attendanceTimeIn: json["attendance_timeIn"],
      lunch_out: json["Lunch_Out"],
      lunch_in: json["Lunch_In"],
      attendanceTimeOut: json["attendance_timeOut"],
    );
  }

  Attendance.lunchOut({this.empId, this.attendanceDate, this.lunch_out});

  Map<String, dynamic> toJson() => {
        "attendance_id": attendanceId,
        "attendance_string": attendanceString,
        "emp_id": empId,
        "attendance_day": attendanceDay,
        "attendance_date":
            "${attendanceDate.year.toString().padLeft(4, '0')}-${attendanceDate.month.toString().padLeft(2, '0')}-${attendanceDate.day.toString().padLeft(2, '0')}",
        "attendance_timeIn": attendanceTimeIn,
        "attendance_timeOut": attendanceTimeOut,
      };
}
