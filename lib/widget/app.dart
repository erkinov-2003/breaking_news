import 'package:breaking_news/src/controller/main_controller.dart';
import 'package:breaking_news/src/presentation/screen/page_builder/page_builder.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: Hive.box("favorite").listenable(),
          builder: (context, value, child) {
            final isDark = value.get("theme", defaultValue: false);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: isDark
                  ? ThemeData.dark(useMaterial3: true)
                  : ThemeData.light(useMaterial3: true),
              title: "Breaking news",
              home: const PageBuilder(),
            );
          },
        );
      },
    );
  }
}
