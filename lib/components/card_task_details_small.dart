import 'package:flutter/material.dart';
import 'package:prm_project/models/task.dart';
import 'package:prm_project/screens/admin/view_task_details_screen.dart';

class CardTaskDetailsSmall extends StatelessWidget {
  final String taskName, description, comment, status;
  final int id, rating;
  final String creatorUsername, assigneeUsername;
  final String imageUrl;
  final String createdAt, updatedAt;
  final String startDate, endDate;

  const CardTaskDetailsSmall({
    this.id,
    this.taskName,
    this.description,
    this.creatorUsername,
    this.assigneeUsername,
    this.comment,
    this.status,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.startDate,
    this.endDate,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Task _task = Task(
        id: id,
        taskName: taskName,
        creatorUsername: creatorUsername,
        assigneeUsername: assigneeUsername,
        description: description,
        status: status,
        startDate: startDate,
        endDate: endDate,
        imageUrl: imageUrl);
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => TaskDetailsScreen(_task))),
      child: Container(
          height: 140,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                    child: Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'Task name:  ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Text(
                    (taskName ?? ""),
                    style: TextStyle(fontSize: 16),
                  ),
                ])),
                Container(
                    child: Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'Creator:        ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Text(
                    (creatorUsername ?? ""),
                    style: TextStyle(fontSize: 16),
                  ),
                ])),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'Assigned to:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(
                        (assigneeUsername ?? ""),
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'Status:          ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple)),
                        child: Text(
                          (status ?? ""),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ])),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'Start date:   ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(
                        (startDate ?? "None"),
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'End date:     ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(
                        (endDate ?? "None"),
                        style: TextStyle(fontSize: 16),
                      ),
                    ])),
              ])),
    );
  }
}
