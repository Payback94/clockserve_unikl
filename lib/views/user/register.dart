import 'package:clockserve_unikl/services/auth.dart';
import 'package:clockserve_unikl/shared/styles.dart';
import 'package:clockserve_unikl/views/user/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String first_name = '';
  String last_name = '';
  String email = '';
  String password = '';
  String password2 = '';
  String race = '';
  String gender = '';
  DateTime date;
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
              label: Text('Login'),
              icon: Icon(Icons.person_pin),
            )
          ],
          title: Text('Register'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                  child: Column(
                children: <Widget>[
                  WelcomeHeader(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Enter First Name' : null,
                            onChanged: (val) {
                              setState(() => first_name = val);
                            },
                            decoration:
                                decorationBox.copyWith(hintText: 'First Name'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Enter password' : null,
                            onChanged: (val) {
                              setState(() => last_name = val);
                            },
                            decoration:
                                decorationBox.copyWith(hintText: 'Last Name'),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Enter password' : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            decoration:
                                decorationBox.copyWith(hintText: 'Password'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: TextFormField(
                            validator: (value) =>
                                value.isEmpty ? 'Enter password' : null,
                            onChanged: (val) {
                              setState(() => password2 = val);
                            },
                            decoration: decorationBox.copyWith(
                                hintText: 'Confirm Password'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration:
                          decorationBox.copyWith(hintText: 'Date of Birth')),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Enter gender' : null,
                      onChanged: (val) {
                        setState(() => gender = val);
                      },
                      decoration: decorationBox.copyWith(hintText: 'Gender')),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      validator: (value) => value.isEmpty ? 'Enter race' : null,
                      onChanged: (val) {
                        setState(() => race = val);
                      },
                      decoration: decorationBox.copyWith(hintText: 'Race')),
                  Container(
                    width: 400,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          await auth.register(first_name, last_name, email,
                              password, password2, gender, race);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }
                      },
                      child: Text('Register'),
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
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
            'Insert your details to register',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
