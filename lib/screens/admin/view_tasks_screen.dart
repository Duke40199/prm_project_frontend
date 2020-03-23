import 'package:flutter/material.dart';
import 'package:prm_project/components/card_task_details_small.dart';
import 'package:prm_project/components/card_user_details_small.dart';
import 'package:prm_project/models/task.dart';
import 'package:prm_project/models/user.dart';
import 'package:prm_project/screens/admin/create_task_screen.dart';

class ViewTasksScreen extends StatefulWidget {
  @override
  _ViewTasksScreenState createState() => _ViewTasksScreenState();
}

class _ViewTasksScreenState extends State<ViewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateTaskScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder<List<Task>>(
          future: fetchTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: <Widget>[
                Column(
                  children: snapshot.data
                      .map(
                        (task) => CardTaskDetailsSmall(
                          taskName: task.taskName,
                          creatorUsername: task.creatorUsername,
                          assignedUsername: task.assignedUsername,
                          status: task.status,
                          createdAt: task.createdAt,
                          description: task.description,
                        ),
                      )
                      .toList(),
                ),
              ]);
            } else if (snapshot.hasError) {
              return Text(snapshot.error);
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch lastest task');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}