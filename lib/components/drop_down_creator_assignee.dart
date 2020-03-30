import 'package:flutter/material.dart';
import 'package:prm_project/models/task.dart';

import '../models/user.dart';

class DropDownUser extends StatefulWidget {
  Task _task;

  DropDownUser(this._task);

  @override
  State<StatefulWidget> createState() => _DropDownUser();
}

class _DropDownUser extends State<DropDownUser> {
  User currentCreator;
  User currentAssignee;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<User>>(
          future: fetchUsersDetailsList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Padding(
              padding: EdgeInsets.fromLTRB(113, 0, 18, 0),
              child: Column(
                children: <Widget>[
                  DropdownButton<User>(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    items: snapshot.data
                        .map((user) => DropdownMenuItem(
                              child: Text(user.username ?? "NONE"),
                              value: user,
                            ))
                        .toList(),
                    onChanged: (User newCreator) {
                      setState(() {
                        currentCreator = newCreator;
                        widget._task.creatorUsername = newCreator.username;
                        print(
                            "New creator username: " + widget._task.creatorUsername);
                      });
                    },
                    isExpanded: true,
                    hint: Text('Select Creator'),
                  ),
                  DropdownButton<User>(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    items: snapshot.data
                        .map((user) => DropdownMenuItem(
                              child: Text(user.username ?? "NONE"),
                              value: user,
                            ))
                        .toList(),
                    onChanged: (User newAssignee) {
                      setState(() {
                        currentAssignee = newAssignee;
                        widget._task.assigneeUsername = newAssignee.username;
                        print("New assignee username: " +
                            widget._task.assigneeUsername);
                      });
                    },
                    isExpanded: true,
                    hint: Text('Select Assignee'),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
