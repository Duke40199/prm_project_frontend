import 'package:flutter/material.dart';
import 'package:prm_project/components/card_task_details_small.dart';
import 'package:prm_project/components/card_user_details_small.dart';
import 'package:prm_project/models/task.dart';
import 'package:prm_project/models/user.dart';
import 'package:prm_project/screens/admin/create_task_screen.dart';

class ViewReviewsScreen extends StatefulWidget {
  @override
  _ViewReviewsScreenState createState() => _ViewReviewsScreenState();
}

class _ViewReviewsScreenState extends State<ViewReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Review")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            'Tasks need to be reviewed',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: FutureBuilder<List<Task>>(
            future: fetchReviewTasksDetailsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: <Widget>[
                  Column(
                    children: snapshot.data
                        .map(
                          (task) => CardTaskDetailsSmall(
                            id: task.id,
                            taskName: task.taskName,
                            creatorUsername: task.creatorUsername,
                            assigneeUsername: task.assigneeUsername,
                            status: task.status,
                            startDate: task.startDate,
                            endDate: task.endDate,
                            description: task.description,
                            imageUrl: task.imageUrl,
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
      ]),
    );
  }
}
