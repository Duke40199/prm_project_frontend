import 'package:flutter/material.dart';
import 'package:prm_project/style/style.dart';

import '../style/style.dart';

class ButtonFullWidth extends StatelessWidget {
  final String label;

  ButtonFullWidth({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: 40,
      child: RaisedButton(
        color: colorPrimary,
        onPressed: () {},
        child: Text(label,
        style: textStyleButtonPrimary,),
      ),
    );
  }
}
