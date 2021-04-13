import 'package:clockserve_unikl/shared/styles.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  DateTime date;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
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
                            decoration: decorationBox.copyWith(
                                hintText: 'Confirm Password'),
                          ),
                        ),
                      ),
                    ],
                  ),
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
