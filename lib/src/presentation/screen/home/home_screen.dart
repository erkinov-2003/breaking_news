import 'package:breaking_news/src/controller/main_controller.dart';
import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:breaking_news/src/presentation/screen/home/details_screen.dart';
import 'package:breaking_news/src/presentation/widget/custom_search.dart';
import 'package:breaking_news/src/presentation/widget/home_view_item.dart';
import 'package:breaking_news/src/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _futureList;

  @override
  void initState() {
    _futureList = fetchFutureFunction();
    super.initState();
  }

  Future<List<dynamic>> fetchFutureFunction() async {
    final service = await ApiService.fetchNewsData();
    return service;
  }

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearch(),
              const SizedBox(height: 30),
              Text(
                "Lastest News",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: _futureList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Divider(
                              color: AppColors.blackColor,
                              height: 2,
                              thickness: 1,
                            ),
                          );
                        },
                        itemBuilder: (context, index) {
                          final article = snapshot.data![index];
                          final image = article["urlToImage"];
                          return image != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: GestureDetector(
                                    onTap: () => mainController.navigatorScreen(
                                      context,
                                      DetailsScreen(
                                        title: article["title"],
                                        description: article["description"],
                                        image: image,
                                      ),
                                    ),
                                    child: CustomHomeItem(
                                      images: image,
                                      title: article["title"],
                                      description: article["description"],
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        },
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                    return const Center(
                      child: Text("Error future builder now data"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
