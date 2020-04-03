import 'package:barcode_scan/barcode_scan.dart';
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
//                      setState(() {
                        currentCreator = newCreator;
                        widget._task.creatorUsername = newCreator.username;
                        print("New creator username: " +
                            widget._task.creatorUsername);
//                      });
                    },
                    isExpanded: true,
                    hint: Text('Select Creator'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: RaisedButton(
                        onPressed: scanCreator,
                        child: const Text('Scan QR for Creator')),
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
//                      setState(() {
                        currentAssignee = newAssignee;
                        widget._task.assigneeUsername = newAssignee.username;
                        print("New assignee username: " +
                            widget._task.assigneeUsername);
//                      });
                    },
                    isExpanded: true,
                    hint: Text('Select Assignee'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: RaisedButton(
                        onPressed: scanAssignee,
                        child: const Text('Scan QR for Assignee')),
                  )
                ],
              ),
            );
          }),
    );
  }

  Future scanCreator() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => widget._task.creatorUsername = barcode);
      print("Creator username: " + widget._task.creatorUsername);
    } catch (e) {
      print(e);
    }
  }

  Future scanAssignee() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => widget._task.assigneeUsername = barcode);
      print("Assignee username: " + widget._task.assigneeUsername);
    } catch (e) {
      print(e);
    }
  }
}
