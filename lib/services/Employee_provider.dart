import 'package:clockserve_unikl/models/employee.dart';
import 'package:flutter/foundation.dart';

class Employee_Provider extends ChangeNotifier {
  //make new employee object
  Employee _emp = new Employee();

  //get employee object
  Employee get emp => _emp;

  //set employee object
  void setEmp(Employee emp) {
    _emp = emp;
    notifyListeners();
  }
}
