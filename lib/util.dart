import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final whatsappLink = "sms:+55 51 98060 0765";
final phoneLink = "tel:+55 51 98060 0765";
final mailtoLink = "mailto:jaq.cat@protonmail.ch";

Tab tab(String text) => Tab(child: Text(text));

void openURL(String url) async {
  await launch(url);
}

Future<List<Map<String, dynamic>>> getRepositories(String username) async {
  http.Response r = await http.get(Uri.parse("https://api.github.com/users/$username/repos"));
  if (r.statusCode == 200)
    return List<Map<String, dynamic>>.from(jsonDecode(r.body).map((e) => {
      'name': e['name'],
      'description': e['description']
    }));
  throw 'Failed to get repositories for $username';
}
