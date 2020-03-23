import 'package:prm_project/components/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:prm_project/models/user.dart';
import 'package:prm_project/screens/admin/view_user_details_screen.dart';

import '../style/style.dart';

class CardUserDetailsSmall extends StatelessWidget {
  final String username;
  final String fullname;
  final String avatarUrl;
  final String phoneNumber;
  final String email;
  final String createdAt;
  final String updatedAt;
  final String role;

  const CardUserDetailsSmall(
      {this.username,
      this.fullname,
      this.avatarUrl,
      this.phoneNumber,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.role});

  @override
  Widget build(BuildContext context) {
    User _user = User(
        username: username,
        fullname: fullname,
        phoneNumber: phoneNumber,
        avatar: avatarUrl,
        email: email,
        role: role,
        createdAt: createdAt);
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => UserDetailsScreen(_user))),
      child: Container(
          height: 150,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Icon(Icons.face),
                      ),
                      Text(
                        username,
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
                Container(
                    padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Icon(Icons.text_fields),
                      ),
                      Text(
                        fullname,
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
                Container(
                    padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Icon(Icons.phone),
                      ),
                      Text(
                        phoneNumber,
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
                Container(
                    padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Icon(Icons.email),
                      ),
                      Text(
                        email,
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
                Container(
                    padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Icon(Icons.business),
                      ),
                      Text(
                        role,
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
              ])),
    );
  }
}
