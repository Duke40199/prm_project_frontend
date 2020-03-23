import 'package:flutter/material.dart';

showErrorSnackBar(BuildContext context, String message) {
  Scaffold.of(context)..removeCurrentSnackBar()..showSnackBar(
    SnackBar(
      content: Text(
        '$message',
        // style: textStyleErrorMessage,
      ),
    ),
  );
}

showInfoSnackBar(BuildContext context, String message) {
  Scaffold.of(context)..removeCurrentSnackBar()..showSnackBar(
    SnackBar(
      content: Text(
        '$message',
        // style: textStyleErrorMessage,
      ),
    ),
  );
}