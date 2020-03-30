import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prm_project/utils/api_caller.dart';
import 'package:prm_project/utils/api_routes.dart';
import 'package:http/http.dart' as http;

class Task {
  int id;
  String taskName, description, comment, status;
  String statusName;
  String creatorUsername, assigneeUsername;
  DateTime startDate, endDate;
  String createdAt, updatedAt;

  Task({
    this.id,
    this.taskName,
    this.description,
    this.assigneeUsername,
    this.creatorUsername,
    this.comment,
    this.status,
    this.statusName,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  Future<bool> createTask(BuildContext context) async {
    final http.Response response = await apiCaller.post(
      route: apiRoutes.createRoute(apiRoutes.createTask),
      body: jsonEncode(
        <String, dynamic>{
          'taskName': this.taskName,
          'description': this.description,
          'assigneeUsername': this.assigneeUsername,
          'creatorUsername': this.creatorUsername,
          'startDate': this.startDate.millisecondsSinceEpoch,
          'endDate': this.endDate.millisecondsSinceEpoch,
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
      creatorUsername: json['createdByUsername'] as String,
      comment: json['comment'] as String,
      status: json['statusName'] as String,
      startDate: json['startDate'],
      endDate: json['endDate'],
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
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
