import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:prm_project/utils/api_caller.dart';
import 'package:prm_project/utils/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:prm_project/utils/secure_storage.dart';

class Task {
  int id;
  String taskName, description, comment, status;
  String statusName;
  String creatorUsername, assigneeUsername;
  String startDate, endDate;
  String createdAt, updatedAt;
  String imageUrl;

  Task(
      {this.id,
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
      this.imageUrl});

  Future<bool> createTask(BuildContext context) async {
    final http.Response response = await apiCaller.post(
      route: apiRoutes.createRoute(apiRoutes.createTask),
      body: jsonEncode(
        <String, dynamic>{
          'taskName': this.taskName,
          'description': this.description,
          'assigneeUsername': this.assigneeUsername,
          'creatorUsername': this.creatorUsername,
          'statusName': this.statusName,
          'startDate': this.startDate,
          'endDate': this.endDate,
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

  Future<bool> updateTask(BuildContext context) async {
    final http.Response response = await apiCaller.put(
      route: apiRoutes.createRoute(apiRoutes.updateTask),
      body: jsonEncode(
        <String, dynamic>{
          'id': this.id,
          'taskName': this.taskName,
          'description': this.description,
          'assigneeUsername': this.assigneeUsername,
          'creatorUsername': this.creatorUsername,
          'statusName': this.statusName,
          'startDate': this.startDate,
          'endDate': this.endDate,
          'imageUrl': this.imageUrl
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
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      imageUrl: json ['imageUrl'] as String,
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

Future<List<Task>> fetchCreatorTasksDetailsList() async {
  var creator = await getUserFromToken();
  String creatorUsername = creator.username;
  final response = await apiCaller.get(
      route: apiRoutes
          .createRoute(apiRoutes.getTasks + '?creator=$creatorUsername'));
  if (response.statusCode == 200) {
    var tasksDetailsListJson = json.decode(response.body)['message'] as List;
    return tasksDetailsListJson.map((tasks) => Task.fromJson(tasks)).toList();
  } else {
    return null;
  }
}

Future<List<Task>> fetchReviewTasksDetailsList() async {
  var creator = await getUserFromToken();
  String creatorUsername = creator.username;
  final response = await apiCaller.get(
      route: apiRoutes.createRoute(apiRoutes.getReviewTasks +
          '?creator=$creatorUsername&statusName=Completed'));
  if (response.statusCode == 200) {
    var tasksDetailsListJson = json.decode(response.body)['message'] as List;
    return tasksDetailsListJson.map((tasks) => Task.fromJson(tasks)).toList();
  } else {
    return null;
  }
}

Future<List<Task>> checkIfCreator() async {
  var creator = await getUserFromToken();
  String creatorUsername = creator.username;
  final response = await apiCaller.get(
      route: apiRoutes.createRoute(apiRoutes.getReviewTasks +
          '?creator=$creatorUsername&statusName=Completed'));
  if (response.statusCode == 200) {
    var tasksDetailsListJson = json.decode(response.body)['message'] as List;
    return tasksDetailsListJson.map((tasks) => Task.fromJson(tasks)).toList();
  } else {
    return null;
  }
}

Future<List<Task>> fetchAssigneeTasksDetailsList() async {
  var assigned = await getUserFromToken();
  String assignedUsername = assigned.username;
  final response = await apiCaller.get(
      route: apiRoutes
          .createRoute(apiRoutes.getTasks + '?assignee=$assignedUsername'));
  if (response.statusCode == 200) {
    var tasksDetailsListJson = json.decode(response.body)['message'] as List;
    return tasksDetailsListJson.map((tasks) => Task.fromJson(tasks)).toList();
  } else {
    return null;
  }
}
