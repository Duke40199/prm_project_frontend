import 'package:flutter/material.dart';
import 'package:prm_project/utils/secure_storage.dart';
import '../restart_app.dart';

logout(BuildContext context) {
  deleteAllFromSecureStorage().then(
        (onValue) => RestartWidget.restartApp(context),
  );
}