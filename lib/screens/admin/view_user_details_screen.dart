import 'package:flutter/material.dart';
import 'package:prm_project/models/user.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen(this._user);
  final User _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_user.username ?? ""),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          IconButton(icon: Icon(Icons.update), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Username: "),
              trailing: Text(_user.username ?? ""),
            ),
            ListTile(
              title: Text("Fullname: "),
              trailing: Text(_user.fullname ?? ""),
            ),
            ListTile(
              title: Text("Phone number: "),
              trailing: Text(_user.phoneNumber ?? ""),
            ),
            ListTile(
              title: Text("Email: "),
              trailing: Text(_user.email ?? ""),
            ),
            ListTile(
              title: Text("Role:"),
              trailing: Text(_user.role ?? ""),
            ),
            ListTile(
              title: Text("Created at:"),
              trailing: Text(_user.createdAt ?? ""),
            ),
            ListTile(
              title: Text("Updated at:"),
              trailing: Text(_user.updatedAt ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
