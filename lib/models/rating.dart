import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prm_project/utils/secure_storage.dart';

import '../utils/api_caller.dart';
import '../utils/api_routes.dart';
import 'package:http/http.dart' as http;

class Rating {
  int id, score,taskId;
  String userId;
  String username, taskName;

  String comment;

  Rating(
      {this.id, this.score, this.userId, this.taskId, this.comment, this.username, this.taskName});


  Future<bool> createRating(BuildContext context, int taskId) async {
    print("comment:" + this.comment);
    print("rating:" + this.score.toString());
    print("postId:" + taskId.toString());
    var creator = await getUserFromToken();
    String creatorId = creator.userId;
    final http.Response response = await apiCaller.post(
      route: apiRoutes.createRoute(apiRoutes.createRating),
      body: jsonEncode(
        <String, dynamic>{
          'userId': creatorId,
          'comment': this.comment,
          'score': this.score,
          'taskId': taskId
        },
      ),
    );
    bool success = response.statusCode == 200;
    if (success) {} else {
      print(json.decode(response.body));
    }
    return success;
  }

  factory Rating.fromJson(dynamic json) {
    return Rating(
      id: json['id'] as int,
      score: json['score'] as int,
      userId: json['userId'] as String,
      taskId: json['taskId'] as int,
      comment: json['comment'] as String,
      taskName:json['taskName'] as String,
      username:json['username'] as String,
    );
  }
}

Future<List<Rating>> fetchRatings() async {
  final http.Response response =
  await apiCaller.get(route: apiRoutes.createRoute(apiRoutes.createRating));
  if (response.statusCode == 200) {
    var ratingsListJson = await json.decode(response.body)['message'] as List;
    print(ratingsListJson);
    return ratingsListJson.map((rating) => Rating.fromJson(rating)).toList();
  } else {
    return null;
  }
}
