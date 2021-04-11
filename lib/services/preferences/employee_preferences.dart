import 'package:clockserve_unikl/models/employee.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Employee_preferences {
  Future<bool> saveEmp(Employee emp) async {
    //basically like session_start() in php but you assign it

    final SharedPreferences empPrefs = await SharedPreferences.getInstance();
    //assigns instances of the key strings
    //set the preference instance to the values of employee
    empPrefs.setInt("emp_id", emp.empId);
    empPrefs.setString("emp_first_name", emp.empFirstName);
    empPrefs.setString("emp_last_name", emp.empLastName);
    empPrefs.setString("emp_birth_date", emp.empBirthDate);
    empPrefs.setString("emp_email", emp.empEmail);
    empPrefs.setString("emp_password", emp.empPassword);
    empPrefs.setString("emp_gender", emp.empGender);
    empPrefs.setString("emp_race", emp.empRace);
  }

  //function to get employee data and return to the provider in main
  Future<Employee> getEmployee() async {
    final SharedPreferences empPrefs = await SharedPreferences.getInstance();
    //assign values of get employee from empPrefs
    int emp_id = empPrefs.getInt('emp_id');
    String emp_first_name = empPrefs.getString("emp_first_name");
    String emp_last_name = empPrefs.getString("emp_last_name");
    String emp_birth_date = empPrefs.getString("emp_birth_date");
    String emp_email = empPrefs.getString("emp_email");
    String emp_password = empPrefs.getString("emp_password");
    String emp_gender = empPrefs.getString("emp_gender");
    String emp_race = empPrefs.getString("emp_race");
    //put the assigned values into employee constructor
    return Employee(
        empId: emp_id,
        empFirstName: emp_first_name,
        empLastName: emp_last_name,
        empBirthDate: emp_birth_date,
        empEmail: emp_email,
        empPassword: emp_password,
        empGender: emp_gender,
        empRace: emp_race);
  }

  void removeEmployee() async {
    final SharedPreferences empPrefs = await SharedPreferences.getInstance();

    empPrefs.remove('emp_id');
    empPrefs.remove("emp_first_name");
    empPrefs.remove("emp_last_name");
    empPrefs.remove("emp_birth_date");
    empPrefs.remove("emp_email");
    empPrefs.remove("emp_password");
    empPrefs.remove("emp_gender");
    empPrefs.remove("emp_race");
  }
}
