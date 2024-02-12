import 'package:breaking_news/src/controller/main_controller.dart';
import 'package:breaking_news/src/core/constants/app_icons.dart';
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            import 'package:breaking_news/src/presentation/widget/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      body: mainController.getFavoriteList.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: mainController.getFavoriteList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: FavoriteItem(
                      image: mainController.getFavoriteList[index].image,
                      title: mainController.getFavoriteList[index].title,
                      description:
                          mainController.getFavoriteList[index].description,
                      index: index,
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(AppIcons.noFavorite),
                    height: 280,
                  ),
                  SizedBox(height: size.height * 0.023),
                  Text(
                    "Your favorites are currently empty",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Text(
                        "You can add an item to your favourites by clicking. for now, you have no regrets about your favorites. You can add your favorite things here.",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
