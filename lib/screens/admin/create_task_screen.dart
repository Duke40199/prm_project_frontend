import 'package:flutter/material.dart';
import 'package:prm_project/components/button_confirm_component.dart';
import 'package:prm_project/components/text_form_field_register.dart';
import 'package:prm_project/models/task.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _formkey = GlobalKey<FormState>();
  final _task = Task();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create task"),
      ),
      body: Container(
        child: ListView(children: <Widget>[
          Form(
              key: _formkey,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormFieldComponent(
                        hintText: 'Task Name',
                        labelText: 'Name',
                        title: 'Task Name:     ',
                        onSaved: (taskName) {
                          setState(() {
                            _task.taskName = taskName;
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the post name!';
                          }
                          return '';
                        },
                      ),
                      TextFormFieldComponent(
                        hintText: 'A short introduction of the task',
                        labelText: 'Description',
                        title: 'Description:     ',
                        onSaved: (description) {
                          setState(() {
                            _task.description = description;
                          });
                        },
                        validator: (description) {
                          if (description.isEmpty) {
                            return 'Please enter description';
                          }
                          return '';
                        },
                        textInputType: TextInputType.multiline,
                      ),
                      TextFormFieldComponent(
                        hintText: 'Select a creator',
                        labelText: 'Creator Username',
                        title: 'Creator:            ',
                        onSaved: (creatorName) {
                          setState(() {
                            _task.creatorUsername = creatorName;
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the creator name!';
                          }
                          return '';
                        },
                      ),
                      TextFormFieldComponent(
                        hintText: 'Select an assignee',
                        labelText: 'Assignee Username',
                        title: 'Assignee:         ',
                        onSaved: (assignedUsername) {
                          setState(() {
                            _task.assignedUsername = assignedUsername;
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the creator name!';
                          }
                          return '';
                        },
                      ),
                      ButtonConfirmComponent(
                        onPressed: () async {
                          final form = _formkey.currentState;
                          if (form.validate()) {
                            form.save();
                            bool success = true;
                            if (success) {
                              Navigator.pushNamed(context, '/create_post');
                            }
                          }
                        },
                        text: 'Create a Post',
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
