import 'package:flutter/material.dart';
import 'package:prm_project/models/task.dart';
import 'package:prm_project/models/user.dart';

class ViewTaskDetailsScreen extends StatelessWidget {
  ViewTaskDetailsScreen(this._task);

  final Task _task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          IconButton(icon: Icon(Icons.update), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Task Name: "),
              trailing: Text(_task.taskName ?? ""),
            ),
            ListTile(
              title: Text("Description: "),
              trailing: Text(_task.description ?? ""),
            ),
            ListTile(
              title: Text("Creator: "),
              trailing: Text(_task.creatorUsername ?? ""),
            ),
            ListTile(
              title: Text("Assigned To: "),
              trailing: Text(_task.assignedUsername ?? ""),
            ),
            ListTile(
              title: Text("Previous Task:"),
              trailing: Text(_task.previousTaskID ?? ""),
            ),
            ListTile(
              title: Text("Comment: "),
              trailing: Text(_task.comment ?? ""),
            ),
            ListTile(
              title: Text("Status:"),
              trailing: Text(_task.status ?? ""),
            ),
            ListTile(
              title: Text("Rating:"),
              trailing: Text(_task.rating ?? ""),
            ),
            ListTile(
              title: Text("Created At:"),
              trailing: Text(_task.createdAt ?? ""),
            ),
            ListTile(
              title: Text("Updated At:"),
              trailing: Text(_task.updatedAt ?? ""),
            ),
            ListTile(
              title: Text("Ended At:"),
              trailing: Text(_task.endedAt ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
