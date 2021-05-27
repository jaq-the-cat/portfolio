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
          itemBuilder: (context, i) {
            final bool shouldDisplay = !snapshot.data[i]['contact'].trim().isEmpty;
            return Container(
              margin: EdgeInsets.symmetric(horizontal:  20, vertical:  20),
              decoration: BoxDecoration(
                border:  Border.all(color: Colors.white24),
                borderRadius:  BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shouldDisplay ? Text(snapshot.data[i]['contact'], style: TextStyle(fontSize: 15, color: Colors.white38)) : Container(),
                    Text(snapshot.data[i]['name'], style: TextStyle(fontSize: 24, color:  Colors.white)),
                    SizedBox(height: 20),
                    Text(snapshot.data[i]['message'], style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.justify),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
}
