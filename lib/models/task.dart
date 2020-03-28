import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prm_project/utils/api_caller.dart';
import 'package:prm_project/utils/api_routes.dart';
import 'package:http/http.dart' as http;

class Task {
  int id;
  String taskName, description, comment, status;
  String statusName;
  String createdByUsername, assigneeUsername;
  String createdAt, updatedAt, endedAt;

  Task({
    this.id,
    this.taskName,
    this.description,
    this.assigneeUsername,
    this.createdByUsername,
    this.comment,
    this.status,
    this.statusName,
    this.createdAt,
    this.updatedAt,
    this.endedAt,
  });

  Future<bool> createTask(BuildContext context) async {
    final http.Response response = await apiCaller.post(
      route: apiRoutes.createRoute(apiRoutes.createTask),
      body: jsonEncode(
        <String, dynamic>{
          'taskName': this.taskName,
          'description': this.description,
          'assignee': this.assigneeUsername,
          'createdBy': this.createdByUsername,
          'status_id': 1
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

  factory Task.fromJson(dynamic json) {
    return Task(
      id: json['id'] as int,
      taskName: json['taskName'] as String,
      description: json['description'] as String,
      assigneeUsername: json['assigneeUsername'] as String,
      createdByUsername: json['createdByUsername'] as String,
      comment: json['comment'] as String,
      status: json['statusName'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      endedAt: json['endedAt'] as String,
    );
  }
}

Future<List<Task>> fetchTasksDetailsList() async {
  final response =
      await apiCaller.get(route: apiRoutes.createRoute(apiRoutes.getTasks));
  if (response.statusCode == 200) {
    var tasksDetailsListJson = json.decode(response.body)['message'] as List;
    return tasksDetailsListJson.map((tasks) => Task.fromJson(tasks)).toList();
  } else {
    return null;
  }
}
