import 'package:prm_project/classes/destination.dart';
import 'package:prm_project/components/button_navigation.dart';
import 'package:prm_project/layouts/destination.dart';
import 'package:prm_project/screens/guest/login.dart';
import 'package:prm_project/screens/guest/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prm_project/screens/guest/explore.dart';

List<Destination> guestDestination = <Destination>[
  Destination('Login', Icons.person, LoginScreen()),
  Destination('Register', Icons.person, RegisterScreen()),
  Destination('Explore', Icons.person, ExploreScreen()),
];

class GuestHomeScreen extends StatefulWidget {
  @override
  _GuestHomeScreenState createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  AnimationController _hide;

  @override
  void initState() {
    super.initState();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: IndexedStack(
            index: _currentIndex,
            children: guestDestination.map<Widget>((Destination destination) {
              return DestinationLayout(
                destination: destination,
                onNavigation: () {
                  _hide.forward();
                },
              );
            }).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.person),
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ButtonNavigation(
                        title: guestDestination[0].title,
                        iconData: guestDestination[0].iconData,
                        isActive: _currentIndex == 0,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      ButtonNavigation(
                        title: guestDestination[1].title,
                        iconData: guestDestination[1].iconData,
                        isActive: _currentIndex == 1,
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
