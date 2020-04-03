import 'package:flutter/material.dart';
import 'package:prm_project/models/role.dart';
import 'package:prm_project/models/user.dart';

class DropDownRole extends StatefulWidget {
  final User _user;

  DropDownRole(this._user);

  @override
  State<StatefulWidget> createState() => _DropDownRole();
}

class _DropDownRole extends State<DropDownRole> {
  Role _currentRole;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Role>>(
          future: fetchRoles(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Padding(
              padding: EdgeInsets.fromLTRB(130, 0, 18, 10),
              child: DropdownButton<Role>(
                style: TextStyle(fontSize: 20, color: Colors.black),
                items: snapshot.data
                    .map((role) => DropdownMenuItem(
                          child: Text(role.roleName ?? "NONE"),
                          value: role,
                        ))
                    .toList(),
                onChanged: (Role value) {
                  widget._user.roleId = value.id;
                },
                isExpanded: true,
                hint: Text('Select Role'),
              ),
            );
          }),
    );
  }
}
