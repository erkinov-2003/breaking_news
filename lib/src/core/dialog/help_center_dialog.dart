import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Future privacyPolicyDialog(BuildContext context, void Function()? onPressed) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColors.blackColor, width: 0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        title: Text(
          "Biz bilan bog'lanish istaysizmi!",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: "Jakarta",
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
      );
    },
  );
}
