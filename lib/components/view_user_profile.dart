import 'package:prm_project/components/card_user_info.dart';
import 'package:prm_project/models/user_profile_info.dart';
import 'package:flutter/material.dart';

class ViewUserProfile extends StatelessWidget {
  final UserProfileInfo userProfileInfo;
  final bool isCurrentUser;

  const ViewUserProfile(
      {Key key, this.userProfileInfo, this.isCurrentUser = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.fromLTRB(10,10,10,10),
        children: <Widget>[
          isCurrentUser
              ? CardUserDetailInfo(
                  avatarUrl: userProfileInfo.avatarUrl,
                  username: userProfileInfo.username,
                  email: userProfileInfo.email,
                  fullname: userProfileInfo.fullname,
                  phoneNumber: userProfileInfo.phoneNumber,
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }
}
