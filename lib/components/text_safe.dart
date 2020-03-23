import 'package:prm_project/style/style.dart';
import 'package:flutter/material.dart';

class TextSafeComponent extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;
  final double textBoxWidth;
  TextSafeComponent({this.text, this.style, this.color, this.textBoxWidth = textboxWidthMedium});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: textBoxWidth,
      child: Text(
        (text == null || text == 'null') ? 'Unknown' : text,
        overflow: TextOverflow.ellipsis,
        maxLines: 5,
        style: style != null ? style.copyWith(color: color) : textStyleDefault.copyWith(color: color),
      ),
    );
  }
}
