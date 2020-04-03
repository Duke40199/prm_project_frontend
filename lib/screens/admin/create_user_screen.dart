import 'package:prm_project/components/button_confirm_component.dart';
import 'package:prm_project/components/drop_down_role.dart';
import 'package:prm_project/components/image_upload_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prm_project/components/text_form_field_register.dart';
import 'package:prm_project/models/user.dart';

class CreateUserScreen extends StatefulWidget {
  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormFieldComponent(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the username!';
                      }
                      return null;
                    },
                    hintText: 'Enter username here',
                    labelText: 'Username',
                    title: 'Username:             ',
                    onSaved: (value) {
                      _user.username = value;
                      print(_user.username);
                    },
                  ),
                  TextFormFieldComponent(
                    hintText: 'Enter fullname here',
                    labelText: 'Fullname',
                    title: 'Fullname:               ',
                    onSaved: (value) {
                      _user.fullname = value;
                      print(_user.fullname);
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
                      _user.phoneNumber = phoneNumber;
                    },
                    maxLines: 1,
                    validator: (value) {
                      if (value.toString().contains(new RegExp(r'[A-Z]'))) {
                        return 'Please enter valid phone number!';
                      }else{
                        print("Phone Number:" + value);
                      }
                      return null;
                    },
                  ),
                  TextFormFieldComponent(
                    hintText: 'Enter email here',
                    labelText: 'Email',
                    title: 'Email:                     ',
                    onSaved: (email) {
                      _user.email = email;
                    },
                    maxLines: 1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the email!';
                      }
                      return null;
                    },
                  ),
                  DropDownRole(_user),
                  ImageUploadComponent('users', _user),
                  ButtonConfirmComponent(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        bool success = await _user.createUser(context);
                        if (success) {
                          Navigator.pushReplacementNamed(context, '/admin');
                        }
                      }
                    },
                    text: 'Create user',
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
