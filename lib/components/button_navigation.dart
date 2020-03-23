import 'package:flutter/material.dart';
import '../style/style.dart';

class ButtonNavigation extends StatelessWidget {
  final String title;
  final Function onPressed;
  final IconData iconData;
  final bool isActive;

  const ButtonNavigation({
    Key key,
    this.title,
    this.onPressed,
    this.iconData,
    this.isActive,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40.0,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: isActive ? colorPrimary : colorInactive,
          ),
          Text(title,
              style: textStyleDefault.copyWith(
                color: isActive ? colorPrimary : colorInactive,
              ))
        ],
      ),
    );
  }
}
