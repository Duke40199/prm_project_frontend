import 'package:prm_project/components/view_user_profile.dart';
import 'package:prm_project/models/user_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:prm_project/utils/authorization.dart';

class UserProfile extends StatefulWidget {
  final String username;
  final bool isCurrentUser; //TODO: if true, hide following button

  const UserProfile({Key key, this.username, this.isCurrentUser = false})
      : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<UserProfileInfo>(
          future: fetchCurrentUserProfileInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  ViewUserProfile(
                    userProfileInfo: snapshot.data,
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
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
