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
            child: Container(
                child: Column(
              children: <Widget>[
                WelcomeHeader(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Enter email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        decoration: decorationBox.copyWith(hintText: 'Email'),
                      ),
                    ],
                  ),
                ),
              ],
            )),
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
