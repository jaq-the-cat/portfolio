import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:github/github.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

final whatsappLink = "sms:+55 51 98060 0765";
final phoneLink = "tel:+55 51 98060 0765";
final mailtoLink = "mailto:jaq.cat@protonmail.ch";

Tab tab(String text) => Tab(child: Text(text));

void openURL(String url) async {
  await launch(url);
}

Future<List<Map<String, dynamic>>> getRepositories(String username) async {
  await dotenv.load();
  var github = GitHub(auth: Authentication.withToken(dotenv.env['GITHUB_API_TOKEN']));
  var r = await github.requestJson('get', "https://api.github.com/users/$username/repos");
  return List<Map<String, dynamic>>.from(r.map((e) => {
    'name': e['name'],
    'description': e['description']
  }));
}
