import 'package:flutter/material.dart';
import 'util.dart';

class RepoButton extends StatelessWidget {

  RepoButton({this.url = "", this.title = "", this.desc = ""}) : super();

  final String url;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:  20, vertical: 10),
        decoration: BoxDecoration(
          border:  Border.all(color: Colors.white24),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      child: InkWell(
        onTap: () => openURL(this.url),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(this.title, style: TextStyle(fontSize: 24, color: Colors.white)),
              SizedBox(height: 8),
              Text(this.desc, style: TextStyle(fontSize: 16, color: Colors.white70), textAlign: TextAlign.center),
            ]
          )
        )
      ),
    );
  }
}

class Projects extends StatelessWidget {

  Projects(this.repos) : super();

  final Future<List<Map<String, dynamic>>> repos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repos,
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) return Padding(
          padding: EdgeInsets.only(top: 10, left: 16),
          child: Text("Loading...",
            style: TextStyle(
              color: Colors.grey,
            )),
        );
        return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context, i) {
          return RepoButton(
            url: 'https://github.com/jaq-the-cat/${snapshot.data[i]["name"]}',
            title: snapshot.data[i]["name"],
            desc: snapshot.data[i]["description"],
          );
        });
      }
    );
  }
}
