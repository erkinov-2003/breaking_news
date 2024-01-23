import 'dart:io';

import 'package:breaking_news/src/service/sertificate.dart';
import 'package:breaking_news/widget/app.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApplication());
}
