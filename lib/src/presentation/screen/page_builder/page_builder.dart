import 'package:breaking_news/src/controller/main_controller.dart';
import 'package:breaking_news/src/core/constants/app_icons.dart';
import 'package:breaking_news/src/presentation/screen/home/home_screen.dart';
import 'package:breaking_news/src/presentation/widget/page_builder_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/favorite_screen.dart';
import '../home/profile_screen.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  late PageController pageController;
  int index = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomAppBar(
          height: size.height * 0.077,
          shadowColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomPageBuilderItem(
                image: AppIcons.homeIcon,
                index: index,
                pageIndex: 0,
                onPressed: () => mainController.navigationPageBuilder(
                  0,
                  index = 0,
                  pageController,
                ),
              ),
              mainController.getFavoriteList.isEmpty
                  ? CustomPageBuilderItem(
                      image: AppIcons.heartIcon,
                      index: index,
                      pageIndex: 1,
                      onPressed: () => mainController.navigationPageBuilder(
                        1,
                        index = 1,
                        pageController,
                      ),
                    )
                  : Badge(
                      label: Text("${mainController.getFavoriteList.length}"),
                      child: CustomPageBuilderItem(
                        image: AppIcons.heartIcon,
                        index: index,
                        pageIndex: 1,
                        onPressed: () => mainController.navigationPageBuilder(
                          1,
                          index = 1,
                          pageController,
                        ),
                      ),
                    ),
              CustomPageBuilderItem(
                image: AppIcons.profileIcon,
                pageIndex: 2,
                index: index,
                onPressed: () => mainController.navigationPageBuilder(
                  2,
                  index = 2,
                  pageController,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          FavoriteScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
