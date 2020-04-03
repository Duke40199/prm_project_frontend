import 'package:flutter/material.dart';
import 'package:prm_project/models/task.dart';
import 'package:prm_project/screens/admin/view_task_details_screen.dart';

class CardReviewDetailSmall extends StatelessWidget {
  final String taskName, username, userId;
  final int id, score, taskId;
  final String comment;
  final String createdAt, updatedAt;

  const CardReviewDetailSmall(
      {this.id,
      this.userId,
      this.taskName,
      this.username,
      this.taskId,
      this.score,
      this.createdAt,
      this.updatedAt,
      this.comment});

  @override
  Widget build(BuildContext context) {
    CardReviewDetailSmall _review = CardReviewDetailSmall(
      id: id,
      taskId: taskId,
      userId: userId,
      taskName: taskName,
      score: score,
      comment: comment,
      username: username,
    );
    return InkWell(
      child: Container(
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'Created by:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(
                        (username ?? "None"),
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
                Container(
                    child: Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'Task name:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Text(
                    (taskName ?? "None"),
                    style: TextStyle(fontSize: 16),
                  ),
                ])),
                Container(
                    child: Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'Comment:  ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Text(
                    (comment ?? ""),
                    style: TextStyle(fontSize: 16),
                  ),
                ])),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'Score:         ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(
                        (score.toString() ?? ""),
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
              ])),
    );
  }
}
