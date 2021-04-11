class Employee {
  int _empId;
  String _empFirstName;
  String _empLastName;
  String _empBirthDate;
  String _empEmail;
  String _empPassword;
  String _empGender;
  String _empRace;

  Employee(
      {int empId,
      String empFirstName,
      String empLastName,
      String empBirthDate,
      String empEmail,
      String empPassword,
      String empGender,
      String empRace}) {
    this._empId = empId;
    this._empFirstName = empFirstName;
    this._empLastName = empLastName;
    this._empBirthDate = empBirthDate;
    this._empEmail = empEmail;
    this._empPassword = empPassword;
    this._empGender = empGender;
    this._empRace = empRace;
  }

  // ignore: unnecessary_getters_setters
  int get empId => _empId;
  // ignore: unnecessary_getters_setters
  set empId(int empId) => _empId = empId;
  // ignore: unnecessary_getters_setters
  String get empFirstName => _empFirstName;
  // ignore: unnecessary_getters_setters
  set empFirstName(String empFirstName) => _empFirstName = empFirstName;
  // ignore: unnecessary_getters_setters
  String get empLastName => _empLastName;
  // ignore: unnecessary_getters_setters
  set empLastName(String empLastName) => _empLastName = empLastName;
  // ignore: unnecessary_getters_setters
  String get empBirthDate => _empBirthDate;
  // ignore: unnecessary_getters_setters
  set empBirthDate(String empBirthDate) => _empBirthDate = empBirthDate;
  // ignore: unnecessary_getters_setters
  String get empEmail => _empEmail;
  // ignore: unnecessary_getters_setters
  set empEmail(String empEmail) => _empEmail = empEmail;
  // ignore: unnecessary_getters_setters
  String get empPassword => _empPassword;
  // ignore: unnecessary_getters_setters
  set empPassword(String empPassword) => _empPassword = empPassword;
  // ignore: unnecessary_getters_setters
  String get empGender => _empGender;
  // ignore: unnecessary_getters_setters
  set empGender(String empGender) => _empGender = empGender;
  // ignore: unnecessary_getters_setters
  String get empRace => _empRace;
  // ignore: unnecessary_getters_setters
  set empRace(String empRace) => _empRace = empRace;

  Employee.fromJson(Map<String, dynamic> json) {
    _empId = int.parse(json['emp_id']);
    _empFirstName = json['emp_first_name'];
    _empLastName = json['emp_last_name'];
    _empBirthDate = json['emp_birth_date'];
    _empEmail = json['emp_email'];
    _empPassword = json['emp_password'];
    _empGender = json['emp_gender'];
    _empRace = json['emp_race'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_first_name'] = this._empFirstName;
    data['emp_last_name'] = this._empLastName;
    data['emp_birth_date'] = this._empBirthDate;
    data['emp_email'] = this._empEmail;
    data['emp_password'] = this._empPassword;
    data['emp_gender'] = this._empGender;
    data['emp_race'] = this._empRace;
    return data;
  }
}
