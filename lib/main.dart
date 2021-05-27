import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'projects.dart';
import 'util.dart';
import 'review.dart';
import 'reviews.dart';
import 'database.dart';

Future<void> initializeServices() async {
  await dotenv.load();
  await Firebase.initializeApp();
  return FirebaseAuth.instance.signInWithEmailAndPassword(
    email: dotenv.env['EMAIL'],
    password: dotenv.env['PASSWORD'],
  );
}

void main() async {
  runApp(MaterialApp(
    title: "Jaquie's Portfolio",
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      accentColor:  Colors.deepOrange,
      visualDensity:  VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
    ),
    home: FutureBuilder(
      future: initializeServices(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        return Portfolio();
      }
    ),
  ));
}

class Portfolio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final List<List<Widget>> tabs = [
      [tab("About me"), Container()],
      [tab("Reviews"), Reviews(getPosts())],
      [tab("Projects"), Projects(getRepositories('jaq-the-cat'))],
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Jaquie's Portfolio"),
          bottom: TabBar(
            tabs: List<Widget>.from(tabs.map((t) => t.first)),
          ),
          actions: [
            TextButton(
              child: Text('Post a review'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Review()));
              },
            ),
          ]
        ),
        body: TabBarView(
          children: List<Widget>.from(tabs.map((t) => t.last)),
        ),
        persistentFooterButtons: [
          IconButton(
            icon: Icon(Icons.mail),
            color: Colors.deepOrange,
            onPressed: () => openURL(mailtoLink),
          ),
          IconButton(
            icon: Icon(Icons.sms),
            color: Colors.deepOrange,
            onPressed: () => openURL(whatsappLink),
          ),
          IconButton(
            icon: Icon(Icons.phone),
            color: Colors.deepOrange,
            onPressed: () => openURL(phoneLink),
          )
        ]
      ),
    );
  }
}
