import 'dart:convert';
import 'package:prm_project/utils/api_caller.dart';
import 'package:prm_project/utils/api_routes.dart';
import 'package:http/http.dart' as http;

class UserDetails {
  String userId, username, avatar, email, fullname, phoneNumber, roleName;

  UserDetails(
      {this.email = '',
      this.fullname = '',
      this.phoneNumber = '',
      this.username = '',
      this.avatar = '', 
      this.roleName = '',
      this.userId = ''
      });

  factory UserDetails.fromJson(dynamic json) {
    return UserDetails(
      avatar: json['avatar'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      fullname: json['fullname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      roleName: json['roleName'] as String,
    );
  }
}

Future<UserDetails> fetchUserDetails(String userId) async {
  final http.Response response = await apiCaller.get(route: '${apiRoutes.createAdminRoute(apiRoutes.getUserProfile)}/${userId}');
  if(response.statusCode == 200) {
    var userDetailsJson = json.decode(response.body)['user'];
    return UserDetails.fromJson(userDetailsJson);
  } else return null;
}

Future<UserDetails> fetchUserProfile() async {
  final http.Response response = await apiCaller.get(route: '${apiRoutes.createAdminRoute(apiRoutes.getUserProfile)}');
  if(response.statusCode == 200) {
    var userDetailsJson = json.decode(response.body)['user'];
    return UserDetails.fromJson(userDetailsJson);
  } else return null;
}

Future<List<UserDetails>> fetchUsersDetailsList() async {
  final http.Response response =
      await apiCaller.get(route: apiRoutes.createAdminRoute(apiRoutes.getUsers));
  if (response.statusCode == 200) {
    var userDetailsListJson = json.decode(response.body)['result'] as List;
    return userDetailsListJson.map((userDetails) => UserDetails.fromJson(userDetails)).toList();
  } else {
    return null;
  }
}
