import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Future infoDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        title: Text(
          "Applicationda siz asosan Yangiliklarni ko'rishingiz mumkin bo'ladi. Yangiliklar asosan english tilida yani america xabarlarini korasiz. Creator erkinovv_dev. Kamchiliklari bo'lsa uzur sorayman. Ishlatilgan api => News Api",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: "Jakarta",
              ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Okey",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueColor,
                    fontFamily: "Jakarta",
                  ),
            ),
          ),
        ],
      );
    },
  );
}
