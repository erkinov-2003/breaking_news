import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenColor,
        fixedSize: const Size(340, 55),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          )
        )
      ),
      child: Text(
        "Get started",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
