import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:github/github.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'dart:convert';
import 'package:g_captcha/g_captcha.dart';
import 'package:http/http.dart' as http;

final whatsappLink = "sms:${dotenv.env['PHONE']}";
final phoneLink = "tel:${dotenv.env['PHONE']}";
final mailtoLink = "mailto:jaq.cat@protonmail.ch";

final String captchaSiteKey = dotenv.env['CAPTCHA_SITE_TOKEN'];
final String captchaSecretKey = dotenv.env['CAPTCHA_SECRET_TOKEN'];


Tab tab(String text) => Tab(child: Text(text));

void openURL(String url) async {
  await launch(url);
}

Future<List<Map<String, dynamic>>> getRepositories(String username) async {
  var github = GitHub(auth: Authentication.withToken(dotenv.env['GITHUB_API_TOKEN']));
  var r = await github.requestJson('get', "https://api.github.com/users/$username/repos");
  return List<Map<String, dynamic>>.from(r.map((e) => {
    'name': e['name'],
    'description': e['description']
  }));
}

Future<bool> doCaptcha() async =>
  json.decode(
    (await http.post(
      Uri.parse('https://www.google.com/recaptcha/api/siteverify'),
      body: {
        'secret': captchaSecretKey,
        'response': await GCaptcha.reCaptcha(captchaSiteKey),
      }
    )).body)['success'];
