import 'dart:convert';

import 'package:breaking_news/src/core/config/app_config.dart';
import 'package:breaking_news/src/service/cleint_service/http_service.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/news_model.dart';

class NewsApiService with ChangeNotifier {
  final HttpService httpService;
  List<ArticlesData> articlesList = [];

  NewsApiService({required this.httpService});

  Future<void> getNewsApi() async {
    final service = await httpService.get(
      headers: {
        "X-Api-Key" : AppConfig.apiKey,
        "Authorization" : AppConfig.apiKey,
      },
      apiPath: AppConfig.apiPath,
      convertor: (body) {
        return NewsApiModel.fromJson(
          jsonDecode(body),
        );
      },
    );
    articlesList = service.articles ?? [];
    notifyListeners();
  }
}
