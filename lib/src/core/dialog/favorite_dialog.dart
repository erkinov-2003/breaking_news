import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Future addFavoriteDialog(BuildContext context, void Function()? onPressed) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        "Sevimlilarga qo'shishni istaysizmi!",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            "Ha",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.redColor,
                  fontFamily: "Jakarta",
                ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Yo'q",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blueColor,
                  fontFamily: "Jakarta",
                ),
          ),
        ),
      ],
    ),
  );
}
