import 'package:flutter/material.dart';
import 'package:prm_project/components/card_user_details_small.dart';
import 'package:prm_project/models/user.dart';
import 'package:prm_project/screens/admin/create_user_screen.dart';

class ViewUsersScreen extends StatefulWidget {
  @override
  _ViewUsersScreenState createState() => _ViewUsersScreenState();
}

class _ViewUsersScreenState extends State<ViewUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateUserScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder<List<User>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: <Widget>[
                Column(
                  children: snapshot.data
                      .map(
                        (user) => CardUserDetailsSmall(
                          username: user.username,
                          fullname: user.fullname,
                          avatarUrl: user.avatar,
                          phoneNumber: user.phoneNumber,
                          email: user.email,
                          role: user.role,
                        ),
                      )
                      .toList(),
                ),
              ]);
            } else if (snapshot.hasError) {
              return Text(snapshot.error);
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch lastest user');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}
