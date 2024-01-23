import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blackColor, width: 0.4),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search news",
                hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
