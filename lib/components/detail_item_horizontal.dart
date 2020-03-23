import 'package:prm_project/components/icon_text.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class DetailItemHoriziontal extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String urlPost;
  final int timeNeeded;
  final String category;
  final int likeCount;
  final int commentCount;
  const DetailItemHoriziontal(
      {this.name,
      this.imageUrl,
      this.urlPost,
      this.timeNeeded,
      this.category,
      this.likeCount,
      this.commentCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
          onTap: () {
            print('haha');
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: FittedBox(
                  child: Image.network(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: colorBackgroundDark.withOpacity(0.75),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          name,
                          textAlign: TextAlign.left,
                          style: textStyleTitleDarkBackground,
                        ),
                        SizedBox(width: 5,),
                        IconTextComponent(
                          icon: Icons.access_alarm,
                          text: timeNeeded.toString() + "'",
                          style: textStyleDarkBackground,
                          iconColor: colorTextDarkBackground,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconTextComponent(
                          icon: Icons.thumb_up,
                          text: likeCount.toString(),
                          style: textStyleDarkBackground,
                          iconColor: colorTextDarkBackground,
                        ),
                        SizedBox(width: 5,),
                        IconTextComponent(
                          icon: Icons.chat_bubble_outline,
                          text: commentCount.toString(),
                          style: textStyleDarkBackground,
                          iconColor: colorTextDarkBackground,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
