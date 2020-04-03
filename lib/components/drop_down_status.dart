import 'package:flutter/material.dart';
import '../models/status.dart';
import '../models/task.dart';

class DropDownStatus extends StatefulWidget {
  final Task _task;

  DropDownStatus(this._task);

  @override
  State<StatefulWidget> createState() => _DropDownStatus();
}

class _DropDownStatus extends State<DropDownStatus> {
  Status _currentStatus;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Status>>(
          future: fetchStatus(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Padding(
              padding: EdgeInsets.fromLTRB(113, 0, 18, 0),
              child: DropdownButton<Status>(
                style: TextStyle(fontSize: 20, color: Colors.black),
                items: snapshot.data
                    .map((status) => DropdownMenuItem(
                          child: Text(status.statusName ?? "NONE"),
                          value: status,
                        ))
                    .toList(),
                onChanged: (Status value) {
                  setState(() {
                    _currentStatus = value;
                    widget._task.statusName = value.statusName;
                  });
                },
                isExpanded: true,
                hint: Text('Select Status'),
              ),
            );
          }),
    );
  }
}
