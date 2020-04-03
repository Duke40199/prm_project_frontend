import 'dart:convert';

import 'package:flutter/material.dart';

import '../utils/api_caller.dart';
import '../utils/api_routes.dart';
import 'package:http/http.dart' as http;

class User {
  String username, fullname, phoneNumber, email;
  String id;
  String avatarUrl;
  String role;
  int roleId;
  String createdAt, updatedAt;

  User(
      {this.id,
      this.username,
      this.fullname,
      this.phoneNumber,
      this.email,
      this.avatarUrl,
      this.role,
      this.roleId,
      this.createdAt,
      this.updatedAt});

  Future<bool> createUser(BuildContext context) async {
    print("fullname:" + this.fullname);
    print("avatarUrl" + this.avatarUrl);
    print("===============roleID: " + this.roleId.toString());
    final http.Response response = await apiCaller.post(
      route: apiRoutes.createRoute(apiRoutes.createUser),
      body: jsonEncode(
        <String, dynamic>{
          'username': this.username,
          'fullname': this.fullname,
          'email': this.email,
          'password': 'admin',
          'confirmPassword': 'admin',
          'phoneNumber': this.phoneNumber,
          'avatarUrl': this.avatarUrl,
          'roleId': this.roleId,
        },
      ),
    );
    bool success = response.statusCode == 200;
    if (success) {
    } else {
      print(json.decode(response.body));
    }
    return success;
  }

  factory User.fromJson(dynamic json) {
    return User(
        id: json['id'] as String,
        fullname: json['fullname'] as String,
        username: json['username'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        role: json['role'] as String,
        avatarUrl: json['avatarUrl'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String);
  }
}

Future<List<User>> fetchUsersDetailsList() async {
  final http.Response response =
      await apiCaller.get(route: apiRoutes.createRoute(apiRoutes.getUsers));
  if (response.statusCode == 200) {
    var userDetailsListJson =
        await json.decode(response.body)['message'] as List;
    return userDetailsListJson
        .map((userDetails) => User.fromJson(userDetails))
        .toList();
  } else {
    return null;
  }
}

List<User> fetchUsersDetailsListSync() {
  final http.Response response =
      apiCaller.get(route: apiRoutes.createRoute(apiRoutes.getUsers));
  if (response.statusCode == 200) {
    var userDetailsListJson = json.decode(response.body)['message'] as List;
    print(userDetailsListJson);
    return userDetailsListJson
        .map((userDetails) => User.fromJson(userDetails))
        .toList();
  } else {
    return null;
  }
}
