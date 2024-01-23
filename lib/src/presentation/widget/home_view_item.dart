import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({
    super.key,
    required this.images,
    required this.title,
    required this.description,
  });
  final String images;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.296,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.whiteColor,
                width: 0.2,
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: images,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.015),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(height: size.height * 0.023),
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
