import 'package:prm_project/components/button_confirm_component.dart';
import 'package:prm_project/components/text_form_field_rectangle.dart';
import 'package:flutter/material.dart';
import 'package:prm_project/models/user_credentials.dart';
import 'package:prm_project/style/style.dart';

import '../../restart_app.dart';
import '../../utils/secure_storage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _userCredentials = UserLoginCredentials();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Builder(
                  builder: (context) => Form(
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200.0,
                          child: Image.asset('lib/assets/images/logo.ico'),
                        ),
                        Center(
                            child: Text("Staff & Task Management System",
                                style: textStyleHeading)),
                        SizedBox(height: 45.0),
                        TextFormFieldRectangle(
                          hintText: 'Username',
                          onSaved: (username) {
                            setState(() {
                              _userCredentials.username = username;
                            });
                          },
                          validator: (username) {
                            if (username.isEmpty)
                              return 'Please enter your username';
                            return null;
                          },
                        ),
                        SizedBox(height: 25.0),
                        TextFormFieldRectangle(
                          obscureText: true,
                          hintText: 'Password',
                          onSaved: (password) {
                            setState(() {
                              _userCredentials.password = password;
                            });
                          },
                          validator: (password) {
                            if (password.isEmpty)
                              return 'Please enter your password';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        ButtonConfirmComponent(
                          text: 'Login',
                          onPressed: () async {
                            final form = _loginFormKey.currentState;
                            if (form.validate()) {
                              form.save();
                              bool success =
                                  await _userCredentials.login(context);
                              var user = await getUserFromToken();
                              print(user.username);
                              String id = user.username;
                              print('after login $id');
                              if (success) {
                                RestartWidget.restartApp(context);
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
