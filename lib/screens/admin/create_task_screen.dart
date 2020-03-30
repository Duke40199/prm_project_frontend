import 'package:flutter/material.dart';
import 'package:prm_project/components/button_confirm_component.dart';
import 'package:prm_project/components/date_picker.dart';
import 'package:prm_project/components/drop_down_creator_assignee.dart';
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
                            return 'Please enter the task name!';
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
                      DropDownUser(_task),
                      DatePicker(_task),

                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                        child: ButtonConfirmComponent(
                          onPressed: () async {
                            print("form creator: " + _task.creatorUsername);
                            print("form assignee: " + _task.assigneeUsername);
                            print(_task.startDate);
                            print(_task.endDate);
                            final form = _formkey.currentState;
                            if (form.validate()) {
                              form.save();
                              bool success = await _task.createTask(context);
                              if (success) {
                                Navigator.pushNamed(context, '/create_post');
                              }
                            }
                          },
                          text: 'Create Post',
                        ),
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
