import 'package:breaking_news/src/controller/main_controller.dart';
import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:breaking_news/src/core/dialog/favorite_dialog.dart';
import 'package:breaking_news/src/data/model/favorite_model.dart';
import 'package:breaking_news/src/data/model/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.articlesData});
  final ArticlesData articlesData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blackColor,
        onPressed: () => addFavoriteDialog(
          context,
          () {
            final model = FavoriteModel(
              title: articlesData.title!,
              description: articlesData.description!,
              image: articlesData.urlToImage!,
            );
            mainController.addFavoriteList(model);
            Navigator.pop(context);
          },
        ),
        child: const Icon(Icons.favorite, color: AppColors.redColor),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: size.height * 0.427,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: articlesData.urlToImage!,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: size.height * 0.560,
                width: double.infinity,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius:  BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  articlesData.title!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.3),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  articlesData.description!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
