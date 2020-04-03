import 'package:prm_project/components/button_confirm_component.dart';
import 'package:flutter/material.dart';
import 'package:prm_project/components/text_form_field_register.dart';
import 'package:prm_project/models/rating.dart';

class CreateRatingScreen extends StatefulWidget {
  final int taskId;

  CreateRatingScreen(this.taskId);

  @override
  _CreateRatingScreenState createState() => _CreateRatingScreenState();
}

class _CreateRatingScreenState extends State<CreateRatingScreen> {
  final _formkey = GlobalKey<FormState>();
  final _rating = Rating();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create rating"),
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
                        hintText: 'Enter comment here',
                        labelText: 'Comment',
                        title: 'Comment:             ',
                        onSaved: (value) {
                          _rating.comment = value;
                        },
                        maxLines: 1,
                        validator: (comment) {
                          if (comment.isEmpty) {
                            return 'Please enter the username!';
                          }
                          return null;
                        },
                      ),
                      Row(children: [
                        Container(
                          child: Text(
                            "Score rating:             ",
                            style: TextStyle(color: Colors.purple),
                          ),
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        ),
                        DropdownButton<int>(
                          items: <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                              .map((int value) {
                            return new DropdownMenuItem<int>(
                              value: value,
                              child: new Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (int changedValue) {
                            setState(() => _rating.score = changedValue);
                          },
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: ButtonConfirmComponent(
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              _formkey.currentState.save();
                              bool success = await _rating.createRating(
                                  context, widget.taskId);
                              if (success) {
                                Navigator.pushReplacementNamed(
                                    context, '/admin');
                              }
                            }
                          },
                          text: 'Create rating',
                        ),
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
