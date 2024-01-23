import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPageBuilderItem extends StatelessWidget {
  const CustomPageBuilderItem({
    super.key,
    required this.image,
    required this.index,
    required this.pageIndex,
    this.onPressed,
  });
  final String image;
  final int index;
  final int pageIndex;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: size.height * 0.050,
        width: size.width * 0.114,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.whiteColor,
              width: 0.1,
            ),
            color: AppColors.blackColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image(
              image: AssetImage(image),
              height: 28,
              color: index == pageIndex ? Colors.red : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
