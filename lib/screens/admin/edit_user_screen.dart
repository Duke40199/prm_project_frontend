import 'package:prm_project/components/button_confirm_component.dart';
import 'package:prm_project/components/image_upload_component.dart';
import 'package:prm_project/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prm_project/components/text_form_field_register.dart';
import 'package:prm_project/models/user.dart';

class EditUserScreen extends StatefulWidget {
  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final _formkey = GlobalKey<FormState>();
  final _post = Post();
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
                        onSaved: (username) {
                          setState(() {
                            _user.username = username;
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the username!';
                          }
                          return '';
                        },
                      ),
                      TextFormFieldComponent(
                        hintText: 'Enter fullname here',
                        labelText: 'Fullname',
                        title: 'Fullname:               ',
                        onSaved: (fullname) {
                          setState(() {
                            _user.fullname = fullname;
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the fullname!';
                          }
                          return '';
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
                          return '';
                        },
                      ),
                      ImageUploadComponent('users', _user),
                      TextFormFieldComponent(
                        hintText: 'A short introduction of the dish',
                        labelText: 'Description',
                        title: 'Description:          ',
                        onSaved: (description) {
                          setState(() {
                            _post.description = description;
                          });
                        },
                        validator: (description) {
                          if (description.isEmpty) {
                            return 'Please enter description';
                          }
                          return '';
                        },
                        textInputType: TextInputType.multiline,
                      ),
                      ButtonConfirmComponent(
                        onPressed: () async {
                          final form = _formkey.currentState;
                          if (form.validate()) {
                            form.save();
                            bool success = true;
                            if (success) {
                              Navigator.pushNamed(context, '/create_post');
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
