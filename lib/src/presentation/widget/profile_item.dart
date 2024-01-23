import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
    required this.images,
    required this.title,
    this.onPressed,
  });
  final String images;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      tileColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.blackColor, width: 0.4),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      leading: Image(
        image: AssetImage(images),
        height: 28,
        color: const Color(0xFF22223b),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w400,
            ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: AppColors.greyColor,
        size: 23,
      ),
    );
  }
}
