import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final whatsappLink = "sms:+55 51 98060 0765";
final phoneLink = "tel:+55 51 98060 0765";
final mailtoLink = "mailto:jaq.cat@protonmail.ch";

Tab tab(String text) => Tab(child: Text(text));

void openURL(String url) async {
  await launch(url);
}
