import 'package:flutter/material.dart';
import 'package:prm_project/components/button_confirm_component.dart';
import 'package:prm_project/models/task.dart';
import 'package:prm_project/screens/admin/create_rating_screen.dart';
import 'package:prm_project/screens/admin/edit_task_screen.dart';

class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsScreen(this._task);

  final Task _task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditTaskScreen(_task)),
                );
              }),
          IconButton(icon: Icon(Icons.update), onPressed: () {}),
        ],
      ),
      body: Container(
        child: (ListView(
          children: [
            ListTile(
              title: Text(
                "ID: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text(_task.id.toString() ?? "" ,style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("Task Name: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Text(_task.taskName ?? "" ,style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("Description: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Text(_task.description ?? "" ,style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("Creator: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Text(_task.creatorUsername ?? "",
                  style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("Assigned To: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Text(_task.assigneeUsername ?? "",
                  style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("Status:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing:
                  Text(_task.status ?? "", style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("Start Date:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing:
                  Text(_task.startDate ?? "", style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("End Date:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing:
                  Text(_task.endDate ?? "", style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("Confirmation Image:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Image(
                fit: BoxFit.contain,
                image: (_task.imageUrl != null)
                    ? NetworkImage(_task.imageUrl)
                    : NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/5/59/Empty.png"),
              ),
            ),
            ButtonConfirmComponent(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateRatingScreen(_task.id)),
                );
              },
              text: 'Review',
            )
          ],
        )),
      ),
    );
  }
}
