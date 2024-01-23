import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({
    super.key,
    required this.images,
    required this.title,
    required this.description,
    required this.authorTitle,
  });
  final String images;
  final String title;
  final String description;
  final String authorTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: images == null
              ? const SizedBox()
              : CachedNetworkImage(
                  imageUrl: images,
                ),
        ),
        const SizedBox(height: 13),
        Text(
          authorTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
