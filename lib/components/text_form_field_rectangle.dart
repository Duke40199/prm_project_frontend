import 'package:flutter/material.dart';
import 'package:prm_project/style/style.dart';

class TextFormFieldRectangle extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final Function onSaved, validator;
  TextFormFieldRectangle(
      {this.hintText, this.obscureText = false, this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: textStyleDefault,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: hintText,
        border: OutlineInputBorder(
           borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
