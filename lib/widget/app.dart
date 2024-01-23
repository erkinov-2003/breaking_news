import 'package:breaking_news/src/controller/main_controller.dart';
import 'package:breaking_news/src/presentation/screen/home/home_screen.dart';
import 'package:breaking_news/src/presentation/screen/page_builder/page_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          title: "Breaking news",
          home: const PageBuilder(),
        );
      },
    );
  }
}
