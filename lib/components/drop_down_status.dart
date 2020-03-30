import 'package:flutter/material.dart';
import 'package:prm_project/models/role.dart';

class DropDownStatus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DropDownStatus();
}

class _DropDownStatus extends State<DropDownStatus> {
  Role _currentRole;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Role>>(
          future: fetchRoles(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return DropdownButton<Role>(
              items: snapshot.data
                  .map((role) => DropdownMenuItem(
                child: Text(role ?? "NONE"),
                value: role,
              ))
                  .toList(),
              onChanged: (Role value) {
                setState(() {
                  _currentRole = value;
                });
              },
              isExpanded: true,
              hint: Text('Select Role'),
            );
          }),
    );
  }
}
