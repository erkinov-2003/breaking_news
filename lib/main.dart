import 'dart:io';

import 'package:breaking_news/src/service/hive_service.dart';
import 'package:breaking_news/src/service/sertificate.dart';
import 'package:breaking_news/widget/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveService.openBox();
  HiveService.registerAdapter();
  runApp(const MyApplication());
}
