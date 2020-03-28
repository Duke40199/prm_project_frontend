import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:prm_project/models/user.dart';
import 'package:prm_project/screens/admin/view_user_details_screen.dart';

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
        avatarUrl: avatarUrl,
        email: email,
        role: role,
        createdAt: createdAt);
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => UserDetailsScreen(_user))),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: GFAvatar(
                  radius: 80,
                  backgroundImage: (avatarUrl != null)
                      ? NetworkImage(avatarUrl)
                      : AssetImage('lib/assets/images/user-default-image.png'),
                  shape: GFAvatarShape.standard),
              // Name & info boxes container,
            ),
            Container(
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                  Container(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                        child: Row(children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Icon(Icons.face),
                          ),
                          Text(
                            (username ?? "None"),
                            style: TextStyle(fontSize: 16),
                          ),
                        ])),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: Row(children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Icon(Icons.text_fields),
                        ),
                        Text(
                          (fullname ?? "None"),
                          style: TextStyle(fontSize: 16),
                        ),
                      ])),
                  Container(
                      padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: Row(children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Icon(Icons.phone),
                        ),
                        Text(
                          (phoneNumber ?? "None"),
                          style: TextStyle(fontSize: 16),
                        ),
                      ])),
                  Container(
                      padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: Row(children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Icon(Icons.email),
                        ),
                        Text(
                          (email ?? "None"),
                          style: TextStyle(fontSize: 16),
                        ),
                      ])),
                  Container(
                      padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: Row(children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Icon(Icons.business),
                        ),
                        Text(
                          (role ?? "None"),
                          style: TextStyle(fontSize: 16),
                        ),
                      ])),
                ])),
          ],
        ),
      ),
    );
  }
}
