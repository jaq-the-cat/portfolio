import 'package:flutter/material.dart';
import 'util.dart';

void main() {
  runApp(Portfolio());
}

class Portfolio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<List<Widget>> tabs = [
      [tab("About me"), Container()],
      [tab("Projects"), Container()],
    ];

    return MaterialApp(
      title: "Jaquie's Portfolio",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor:  Colors.deepOrange,
        visualDensity:  VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Jaquie's very cool portfolio"),
            bottom: TabBar(
              tabs: List<Widget>.from(tabs.map((t) => t.first)),
            ),
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
      ),
    );
  }
}
