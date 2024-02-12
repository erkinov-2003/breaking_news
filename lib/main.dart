import 'dart:io';

import 'package:breaking_news/src/service/user_api_service/sertificate.dart';
import 'package:breaking_news/widget/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("favorite");
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApplication());
}
