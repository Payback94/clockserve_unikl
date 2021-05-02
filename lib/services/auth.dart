import 'dart:async';
import 'dart:convert';

import 'package:clockserve_unikl/models/employee.dart';
import 'package:clockserve_unikl/services/preferences/employee_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthService extends ChangeNotifier {
  //setting the status
  Status _loggedInStats = Status.NotLoggedIn;
  Status _registeredInStats = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStats;
  Status get registeredInStats => _registeredInStats;

  //methods for logging in
  Future<Map<String, dynamic>> empLogin(String email, String password) async {
    var result;
    //we are listening for changes
    _loggedInStats = Status.Authenticating;
    notifyListeners();

    //sending request over http to database
    Response response = await post(
        Uri.parse('https://192.168.0.144/ClockServe_app/api/login.php'),
        body: json.encode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    //for successful script run
    //decode json response to body
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var empData = responseData;
      //return results from responsedata into authEmp
      Employee authEmp = Employee.fromJson(empData);

      Employee_preferences().saveEmp(authEmp);

      _loggedInStats = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'successful', 'employee': authEmp};
    } else {
      //if we failed to login because of bad credentials
      _loggedInStats = Status.NotLoggedIn;
      notifyListeners();
      result = {'status': false, 'message': json.decode(response.body)};
    }
    print(result);
    return result;
  }

  //for registering new users
  Future<Map<String, dynamic>> register(
      String empFirstName,
      String empLastName,
      String email,
      String password,
      String confirm_password,
      String gender,
      String race) async {
    final Map<String, dynamic> registrationData = {
      'user': {
        'first_name': empFirstName,
        'last_name': empLastName,
        'email': email,
        'password': password,
        'password2': confirm_password,
        'race': race,
      }
    };

    _registeredInStats = Status.Registering;
    notifyListeners();

    return await post(
            Uri.parse('https://192.168.0.144/ClockServe_app/api/register.php'),
            body: json.encode({
              'first_name': empFirstName,
              'last_name': empLastName,
              'email': email,
              'password': password,
              'password2': confirm_password,
              'gender': gender,
              'race': race
            }),
            headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      var empData = responseData;

      Employee authEmp = Employee.fromJson(empData);

      Employee_preferences().saveEmp(authEmp);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authEmp
      };
    } else {
      result = {
        'status': false,
        'message': 'Cant registered',
        'data': responseData
      };
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");

    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
