import 'package:breaking_news/src/controller/main_controller.dart';
import 'package:breaking_news/src/core/config/app_config.dart';
import 'package:breaking_news/src/presentation/screen/page_builder/page_builder.dart';
import 'package:breaking_news/src/service/cleint_service/http_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainController()),
        Provider(
          create: (context) => HttpService(baseUrl: AppConfig.baseUrl),
        ),
      ],
      child: ValueListenableBuilder(
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
      ),
    );
  }
}
