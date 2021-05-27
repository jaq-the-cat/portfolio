import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reviews extends StatefulWidget {

  final Future<List<QueryDocumentSnapshot>> posts;

  Reviews(this.posts);

  @override
  ReviewsState createState() => ReviewsState();
}

class ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.posts,
      builder: (context, AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
        if (!snapshot.hasData) return Padding(
          padding: EdgeInsets.only(top: 10, left: 16),
          child: Text("Loading...",
            style: TextStyle(
              color: Colors.grey,
            )),
        );
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, i) => Container(
            margin: EdgeInsets.symmetric(horizontal:  20, vertical:  40),
            decoration: BoxDecoration(
              border:  Border.all(color: Colors.black45),
              borderRadius:  BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data[i]['email'], style: Theme.of(context).textTheme.headline5),
                Text(snapshot.data[i]['name'], style: Theme.of(context).textTheme.headline4),
                Text(snapshot.data[i]['message'], style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          )
        );
      }
    );
  }
}
