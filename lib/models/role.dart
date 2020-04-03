import 'dart:convert';

import '../utils/api_caller.dart';
import '../utils/api_routes.dart';
import 'package:http/http.dart' as http;

class Role {
  int id;
  String roleName;

  Role({this.id, this.roleName});

  factory Role.fromJson(dynamic json) {
    return Role(id: json['id'] as int, roleName: json['roleName'] as String);
  }
}

Future<List<Role>> fetchRoles() async {
  final http.Response response =
      await apiCaller.get(route: apiRoutes.createRoute(apiRoutes.getRoles));
  if (response.statusCode == 200) {
    var rolesListJson = await json.decode(response.body)['message'] as List;
    print(rolesListJson);
    return rolesListJson.map((role) => Role.fromJson(role)).toList();
  } else {
    return null;
  }
}
