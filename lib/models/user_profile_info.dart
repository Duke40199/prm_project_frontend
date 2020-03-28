import 'dart:convert';

import 'package:prm_project/utils/api_caller.dart';
import 'package:prm_project/utils/secure_storage.dart';
import 'package:http/http.dart' as http;

class UserProfileInfo {
  String userId, username, avatarUrl, email, fullname, roleName, phoneNumber;

  UserProfileInfo({
    this.userId,
    this.username,
    this.avatarUrl,
    this.email,
    this.fullname,
    this.roleName,
    this.phoneNumber,
  });

  factory UserProfileInfo.fromJson(dynamic json) {
    return UserProfileInfo(
      userId: json['userId'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatarUrl'] as String,
      email: json['email'] as String,
      fullname: json['fullname'] as String,
      roleName: json['roleName'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
}

Future<UserProfileInfo> fetchCurrentUserProfileInfo() async {
  var currentUser = await getUserFromToken();
  String username = currentUser.username;
  final http.Response response = await apiCaller.get(route: '/users/$username');
  if (response.statusCode == 200) {
    var userDetailsJson = json.decode(response.body)['message'];
    return UserProfileInfo.fromJson(userDetailsJson);
  } else
    return null;
}

