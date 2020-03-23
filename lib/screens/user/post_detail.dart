import 'package:prm_project/style/style.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: FittedBox(
                  child: Image.network(
                      'https://i.picsum.photos/id/237/536/354.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colorBackgroundDark.withOpacity(0),
                    colorBackgroundDark.withOpacity(1)
                  ],
                )),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container(),), // push text to bottom
                    Text(
                      'Grilled Lemony Salmon',
                      textAlign: TextAlign.left,
                      style: textStyleHeadingDark,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            
          ),
        )
      ],
    ));
  }
}
