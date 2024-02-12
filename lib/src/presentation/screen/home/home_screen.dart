import 'package:breaking_news/src/data/model/news_model.dart';
import 'package:breaking_news/src/service/cleint_service/http_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/main_controller.dart';
import '../../../core/constants/app_icons.dart';
import '../../../service/user_api_service/news_api_service.dart';
import '../../widget/home_view_item.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsApiService newsApiService;

  @override
  void initState() {
    newsApiService = NewsApiService(
      httpService: context.read<HttpService>(),
    )..getNewsApi();
    super.initState();
  }

  @override
  void dispose() {
    newsApiService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Breaking news",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            AppIcons.splashIcon,
            height: 40,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: ChangeNotifierProvider.value(
              value: newsApiService,
              child: Selector<NewsApiService, List<ArticlesData>>(
                selector: (selector, selectorList) {
                  return selectorList.articlesList;
                },
                builder: (context, value, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: value.isEmpty
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : RefreshIndicator(
                                onRefresh: () {
                                  return context
                                      .read<NewsApiService>()
                                      .getNewsApi();
                                },
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: value.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: GestureDetector(
                                        onTap: () =>
                                            mainController.navigatorScreen(
                                          context,
                                          DetailsScreen(
                                            articlesData: value[index],
                                          ),
                                        ),
                                        child: value.isNotEmpty
                                            ? CustomHomeItem(
                                                images:
                                                    value[index].urlToImage ??
                                                        "",
                                                title: value[index].title ?? "",
                                                description:
                                                    value[index].description ??
                                                        "",
                                              )
                                            : const SizedBox(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
                    ],
                  );
                },
              ),
            )),
      ),
    );
  }
}
