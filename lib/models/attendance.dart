class Attendance {
  int _attendanceID;
  int _empId;
  String _attendanceString;
  DateTime _timeIn;
  DateTime _timeOut;

  Attendance(
      {int attendanceId,
      int emp_id,
      String attendanceString,
      DateTime timeIn,
      DateTime timeOut}) {
    this._attendanceID = attendanceId;
    this._empId = emp_id;
    this._attendanceString = attendanceString;
    this._timeIn = timeIn;
    this._timeOut = timeIn;
  }

  Attendance.fromjson() {}
}
