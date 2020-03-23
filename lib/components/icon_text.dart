import 'package:prm_project/components/text_safe.dart';
import 'package:flutter/material.dart';

class IconTextComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final TextStyle style;
  final Color color;
  final double textBoxWidth;
  IconTextComponent({this.iconColor, this.text, this.icon, this.style, this.textBoxWidth, this.color});

  @override
  Widget build(BuildContext context) { 
    return Row(
      children: <Widget>[
        Icon(icon, color: iconColor,),
        SizedBox(
          width: 5.0,
        ),
        TextSafeComponent(
          text: text,
          style: style,
          color: color,
          textBoxWidth: textBoxWidth,
        ),
      ],
    );
  }
}
