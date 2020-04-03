import 'package:flutter/material.dart';
import 'package:prm_project/components/button_confirm_component.dart';
import 'package:prm_project/components/confirm_image_upload_component.dart';
import 'package:prm_project/components/date_picker.dart';
import 'package:prm_project/components/drop_down_creator_assignee.dart';
import 'package:prm_project/components/drop_down_status.dart';
import 'package:prm_project/components/text_form_field_register.dart';
import 'package:prm_project/models/task.dart';
import 'package:prm_project/models/user.dart';
import 'package:prm_project/models/user_profile_info.dart';
import 'package:prm_project/utils/secure_storage.dart';

class EditTaskScreen extends StatefulWidget {
  final Task _task;

  EditTaskScreen(this._task);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit task"),
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
                        hintText: widget._task.taskName,
                        labelText: 'Name',
                        title: 'Task Name:     ',
                        onSaved: (taskName) {
                          setState(() {
                            widget._task.taskName = taskName;
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
                        hintText: widget._task.description,
                        labelText: 'Description',
                        title: 'Description:     ',
                        onSaved: (description) {
                          setState(() {
                            widget._task.description = description;
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
                      DropDownUser(widget._task),
                      DropDownStatus(widget._task),
                      DatePicker(widget._task),
                      ConfirmImageUploadComponent('confirm', widget._task),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                        child: ButtonConfirmComponent(
                          onPressed: () async {
                            print("form creator: " +
                                widget._task.creatorUsername);
                            print("form assignee: " +
                                widget._task.assigneeUsername);
                            print(widget._task.id);
                            print(widget._task.startDate);
                            print(widget._task.endDate);
                            print(widget._task.imageUrl);
                            final form = _formkey.currentState;
                            if (form.validate()) {
                              form.save();
                              bool success =
                                  await widget._task.updateTask(context);
                              if (success) {
                                Navigator.pushNamed(context, '/admin');
                              }
                            }
                          },
                          text: 'Update Task',
                        ),
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
