import 'package:prm_project/models/user_details.dart';
import 'package:prm_project/restart_app.dart';
import 'package:prm_project/screens/admin/admin_screen.dart';
import 'package:prm_project/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/admin/admin_screen.dart';
import 'screens/guest/login.dart';
import 'utils/secure_storage.dart';

void main() async {
  await DotEnv().load('.env');
  UserDetails user = await getUserFromToken();
  if (user != null)
    runApp(RestartWidget(
      child: MyApp(
        user: user,
      ),
    ));
  else
    runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final UserDetails user;

  MyApp({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staff & Task Management System',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: (user != null) ? '/admin' : '/guest',
      routes: {
        '/admin': (context) => FutureBuilder<UserDetails>(
            future: getUserFromToken(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return AdminScreen();
              else
                return LoginScreen();
            }),
        '/guest': (context) => FutureBuilder<UserDetails>(
            future: getUserFromToken(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return AdminScreen();
              else
                return LoginScreen();
            }),
      },
    );
  }
}
