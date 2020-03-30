import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prm_project/models/task.dart';

class DatePicker extends StatefulWidget {
  DatePicker(this._task);

  final Task _task;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime currentStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');

  _selectStartDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentStartDate,
        firstDate: DateTime.now().subtract(Duration(days: 1)),
        lastDate: DateTime(2101));
    if (pickedDate != null && pickedDate != currentStartDate)
      setState(() {
        currentStartDate = pickedDate;
        widget._task.startDate = formatter.format(pickedDate);
        print("Start Date:");
        print(widget._task.startDate);
        if (selectedEndDate.isBefore(currentStartDate)) {
          selectedEndDate = currentStartDate;
        }
      });
  }

  _selectEndDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedEndDate,
        firstDate: currentStartDate,
        lastDate: DateTime(2101));
    if (pickedDate != null && pickedDate != selectedEndDate)
      setState(() {
        selectedEndDate = pickedDate;
        print('EndDate:');
        widget._task.endDate = formatter.format(pickedDate);
        print(widget._task.endDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: RaisedButton(
                  color: Colors.purple,
                  onPressed: () => _selectStartDate(context),
                  child:
                      Text("Start date", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: Text(
                    "${currentStartDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: RaisedButton(
                  color: Colors.purple,
                  onPressed: () => _selectEndDate(context),
                  child:
                      Text(" End date ", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: Text(
                    "${selectedEndDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
