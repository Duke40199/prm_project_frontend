import 'package:flutter/material.dart';
import './view_tasks_screen.dart';
import './view_users_screen.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedScreen = 0;
  final _pageOptions = [
    ViewUsersScreen(),
    ViewTasksScreen(),
    ViewTasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedScreen],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.purple,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          currentIndex: _selectedScreen,
          onTap: (int index) {
            setState(() {
              _selectedScreen = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts), title: Text('Users')),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), title: Text('Groups')),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_chart), title: Text('Tasks')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile')),
            BottomNavigationBarItem(
                icon: Icon(Icons.power_settings_new), title: Text('Log out')),
          ],
        ),
      ),
    );
  }
}
