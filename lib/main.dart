import 'package:prm_project/models/user_details.dart';
import 'package:prm_project/restart_app.dart';
import 'package:prm_project/screens/admin/admin_screen.dart';
import 'package:prm_project/screens/admin/view_users_screen.dart';
import 'package:prm_project/screens/admin/view_user_details_screen.dart';
import 'package:prm_project/screens/guest/home.dart';
import 'package:prm_project/screens/user/home.dart';
import 'package:prm_project/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      title: 'Stask Manager',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: (user != null) ? '/user' : '/users',
      routes: {
        '/user': (context) => UserHomeScreen(),
        '/guest': (context) => GuestHomeScreen(),
        '/users': (context) => AdminScreen(),
      },
    );
  }
}
