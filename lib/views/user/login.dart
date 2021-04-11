import 'package:clockserve_unikl/models/employee.dart';
import 'package:clockserve_unikl/services/Employee_provider.dart';
import 'package:clockserve_unikl/services/auth.dart';
import 'package:clockserve_unikl/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            label: Text('Register'),
            icon: Icon(Icons.person_add),
          )
        ],
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                WelcomeHeader(),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: decorationBox.copyWith(hintText: 'Email'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter password' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  obscureText: true,
                  decoration: decorationBox.copyWith(hintText: 'Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    AuthService auth = new AuthService();
                    final Future<Map<String, dynamic>> successMsg =
                        auth.empLogin(email, password);
                    successMsg.then((response) {
                      if (response['status']) {
                        Employee emp = response['employee'];
                        Provider.of<Employee_Provider>(context, listen: false)
                            .setEmp(emp);
                        Navigator.pushReplacementNamed(
                            context, '/navigatorPage');
                      }
                    });
                  },
                  child: Text('Log In'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Welcome To ClockServe',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
          ),
          Divider(
            height: 20,
            thickness: 2,
          ),
          Text(
            'Enter your credentials to login',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
