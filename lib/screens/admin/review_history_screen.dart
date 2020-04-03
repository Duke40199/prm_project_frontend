import 'package:flutter/material.dart';
import 'package:prm_project/components/card_review_details_small.dart';
import 'package:prm_project/models/rating.dart';

class ReviewHistoryScreen extends StatefulWidget {
  @override
  _ReviewHistoryScreenState createState() => _ReviewHistoryScreenState();
}

class _ReviewHistoryScreenState extends State<ReviewHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review History"),
      ),
      body: Container(
        child: FutureBuilder<List<Rating>>(
          future: fetchRatings(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: <Widget>[
                Column(
                  children: snapshot.data
                      .map(
                        (rating) => CardReviewDetailSmall(
                          id: rating.id,
                          taskId: rating.taskId,
                          username: rating.username,
                          taskName: rating.taskName,
                          comment: rating.comment,
                          score: rating.score,
                        ),
                      )
                      .toList(),
                ),
              ]);
            } else if (snapshot.hasError) {
              return Text(snapshot.error);
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch lastest user');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}
