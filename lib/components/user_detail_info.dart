import 'package:flutter/material.dart';
import '../style/style.dart';

class UserDetailInfo extends StatelessWidget {
  final int number;
  final String title;

  UserDetailInfo({this.number, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          number.toString(),
          style: textStyleDefault,
        ),
        Text(
          title,
          style: textStyleDefaultPrimary,
        )
      ],
    );
  }
}
