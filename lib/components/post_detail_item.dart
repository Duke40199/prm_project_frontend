import 'package:flutter/material.dart';

import '../style/style.dart';

class PostDetailItem extends StatelessWidget {
  final String name;
  final String urlPic;
  final String urlPost;
  final int time;
  final String category;
  final int likes;
  final int comments;

  const PostDetailItem(
      {this.name,
      this.urlPic,
      this.urlPost,
      this.time,
      this.category,
      this.likes,
      this.comments});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            print('haha');
          },
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                child: FittedBox(
                  child: Image.network(
                      'https://i.picsum.photos/id/237/536/354.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        name,
                        textAlign: TextAlign.left,
                        style: textStyleSubtitle,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        likes.toString() + ' likes ' + comments.toString() + ' comments',
                        textAlign: TextAlign.left,
                        style: textStyleDefaultPrimary,
                      ),
                      SizedBox(height: 5,),
                      Text (
                        'Category: ' + category + ' | ' + time.toString() + "'",
                        textAlign: TextAlign.left,
                        style: textStyleDefault,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
