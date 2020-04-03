import 'dart:convert';

import 'package:prm_project/utils/api_caller.dart';
import 'package:prm_project/utils/api_routes.dart';
import 'package:http/http.dart' as http;

class Status {
  int id;
  String statusName;

  Status({
    this.id,
    this.statusName,
  });

  factory Status.fromJson(dynamic json) {
    return Status(
      id: json['id'] as int,
      statusName: json['statusName'] as String,
    );
  }
}

Future<List<Status>> fetchStatus() async {
  final http.Response response =
      await apiCaller.get(route: apiRoutes.createRoute(apiRoutes.getStatus));
  if (response.statusCode == 200) {
    var statusDetailsListJson =
        await json.decode(response.body)['message'] as List;
    return statusDetailsListJson
        .map((status) => Status.fromJson(status))
        .toList();
  } else
    return null;
}
