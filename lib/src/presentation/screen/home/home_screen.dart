import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../controller/main_controller.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../service/api_service.dart';
import '../../widget/home_view_item.dart';
import 'details_screen.dart';

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

  Future<void> _refresh() async {
    setState(() {
      _futureList = fetchFutureFunction();
    });
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
          child: RefreshIndicator(
            backgroundColor: Colors.green,
            onRefresh: _refresh,
            child: FutureBuilder(
              future: _futureList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final article = snapshot.data![index];
                            final image = article["urlToImage"];
                            return image != null
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: GestureDetector(
                                      onTap: () =>
                                          mainController.navigatorScreen(
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
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.greenColor,
                    ),
                  );
                }
                return Center(
                  child: Lottie.asset(
                    "assets/lottie/Animation - 1706212950166.json",
                    height: 190,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
