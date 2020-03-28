import 'package:prm_project/components/button_confirm_component.dart';
import 'package:prm_project/components/drop_down_role.dart';
import 'package:prm_project/components/image_upload_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prm_project/components/text_form_field_register.dart';
import 'package:prm_project/models/role.dart';
import 'package:prm_project/models/user.dart';

class CreateUserScreen extends StatefulWidget {
  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _formkey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create user"),
      ),
      body: Container(
        child: ListView(children: <Widget>[
          Form(
              key: _formkey,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormFieldComponent(
                        hintText: 'Enter username here',
                        labelText: 'Username',
                        title: 'Username:             ',
                        onSaved: (username) =>
                            setState(() => _user.username = username),
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the username!';
                          }
                          return null;
                        },
                      ),
                      TextFormFieldComponent(
                        hintText: 'Enter fullname here',
                        labelText: 'Fullname',
                        title: 'Fullname:               ',
                        onSaved: (fullname) {
                          setState(() {
                            _user.fullname = fullname;
                            print(_user.fullname);
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the fullname!';
                          }
                          return null;
                        },
                      ),
                      TextFormFieldComponent(
                        hintText: 'Enter phone number here',
                        labelText: 'Phone number',
                        title: 'Phone number:     ',
                        onSaved: (phoneNumber) {
                          setState(() {
                            _user.phoneNumber = phoneNumber;
                          });
                        },
                        maxLines: 1,
                      ),
                      TextFormFieldComponent(
                        hintText: 'Enter email here',
                        labelText: 'Email',
                        title: 'Email:                     ',
                        onSaved: (email) {
                          setState(() {
                            _user.email = email;
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the email!';
                          }
                          return null;
                        },
                      ),
                      DropDownRole(),
                      ImageUploadComponent('users', _user),
                      ButtonConfirmComponent(
                        onPressed: () async {
                          final form = _formkey.currentState;
                          if (form.validate()) {
                            form.save();
                            bool success = await _user.createUser(context);
                            if (success) {
                              Navigator.pushReplacementNamed(context, '/admin');
                            }
                          }
                        },
                        text: 'Create user',
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
