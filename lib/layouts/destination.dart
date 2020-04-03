import 'package:prm_project/classes/view_navigation_observer.dart';
import 'package:prm_project/style/style.dart';
import 'package:flutter/material.dart';
import '../classes/destination.dart';

class DestinationLayout extends StatefulWidget {
  final Destination destination;
  final VoidCallback onNavigation;

  DestinationLayout({Key key, this.destination, this.onNavigation})
      : super(key: key);

  @override
  _DestinationLayoutState createState() => _DestinationLayoutState();
}

class _DestinationLayoutState extends State<DestinationLayout> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        Widget body;
        switch (settings.name) {
          case '/':
            body = widget.destination.component;
            break;
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: colorAppBar,
                title: Text(
                  settings.name == '/' ? widget.destination.title : title,
                  style: textStyleHeading,
                ),
                elevation: 0,
              ),
              body: body,
            );
          },
        );
      },
    );
  }
}
