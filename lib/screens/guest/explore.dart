import 'package:prm_project/components/card_post_detail_half_size.dart';
import 'package:prm_project/components/detail_item_horizontal.dart';
import 'package:prm_project/components/text_safe.dart';
import 'package:prm_project/models/post.dart';
import 'package:prm_project/style/style.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextSafeComponent(
              text: 'Recommended for You',
              style: textStyleTitle,
            ),
          ),
          FutureBuilder<Post>(
            future: fetchLastestPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DetailItemHoriziontal(
                  category: snapshot.data.categoryId.toString(),
                  name: snapshot.data.postName,
                  likeCount: snapshot.data.likeCount,
                  timeNeeded: snapshot.data.timeNeeded,
                  commentCount: snapshot.data.commentCount,
                  imageUrl: snapshot.data.imageUrl,
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error);
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text('Unable to fetch lastest post');
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextSafeComponent(
              text: 'Promotion: 20% Off This Week!',
              style: textStyleTitle,
            ),
          ),
          FutureBuilder<List<Post>>(
            future: fetchPromotionList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.data
                        .map(
                          (post) => CardPostDetailsHalfSize(
                            category: post.categoryId.toString(),
                            name: post.postName,
                            likeCount: post.likeCount,
                            timeNeeded: post.timeNeeded,
                            commentCount: post.commentCount,
                            imageUrl: post.imageUrl,
                          ),
                        )
                        .toList(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error);
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text('Unable to fetch lastest post');
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextSafeComponent(
              text: 'Popular',
              style: textStyleTitle,
            ),
          ),
          FutureBuilder<List<Post>>(
            future: fetchPopularPostsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.data
                        .map(
                          (post) => CardPostDetailsHalfSize(
                            category: post.categoryId.toString(),
                            name: post.postName,
                            likeCount: post.likeCount,
                            timeNeeded: post.timeNeeded,
                            commentCount: post.commentCount,
                            imageUrl: post.imageUrl,
                          ),
                        )
                        .toList(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error);
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text('Unable to fetch lastest post');
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ],
      ),
    );
  }
}
