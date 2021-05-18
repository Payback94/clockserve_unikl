// To parse this JSON data, do
//
//     final leaverequest = leaverequestFromJson(jsonString);

import 'dart:convert';

Leaverequest leaverequestFromJson(String str) =>
    Leaverequest.fromJson(json.decode(str));

String leaverequestToJson(Leaverequest data) => json.encode(data.toJson());

class Leaverequest {
  Leaverequest({
    this.requestId,
    this.empId,
    this.empFirstName,
    this.requestType,
    this.requestReason,
    this.dateLeave,
    this.dateReturn,
    this.requestApproval,
  });

  String requestId;
  String empId;
  String empFirstName;
  String requestType;
  String requestReason;
  DateTime dateLeave;
  DateTime dateReturn;
  String requestApproval;

  factory Leaverequest.fromJson(Map<String, dynamic> json) => Leaverequest(
        requestId: json["request_id"],
        empId: json["emp_id"],
        empFirstName: json["emp_first_name"],
        requestType: json["request_type"],
        requestReason: json["request_reason"],
        dateLeave: DateTime.parse(json["date_leave"]),
        dateReturn: DateTime.parse(json["date_return"]),
        requestApproval: json["request_approval"],
      );

  Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "emp_id": empId,
        "emp_first_name": empFirstName,
        "request_type": requestType,
        "request_reason": requestReason,
        "date_leave":
            "${dateLeave.year.toString().padLeft(4, '0')}-${dateLeave.month.toString().padLeft(2, '0')}-${dateLeave.day.toString().padLeft(2, '0')}",
        "date_return":
            "${dateReturn.year.toString().padLeft(4, '0')}-${dateReturn.month.toString().padLeft(2, '0')}-${dateReturn.day.toString().padLeft(2, '0')}",
        "request_approval": requestApproval,
      };
}
