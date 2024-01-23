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
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 50,
        width: 50,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image(
              image: AssetImage(image),
              height: 32,
              color: index == pageIndex ? Colors.red : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
