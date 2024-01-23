import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:breaking_news/src/core/constants/app_icons.dart';
import 'package:breaking_news/src/presentation/widget/profile_item.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              CustomProfileItem(
                images: AppIcons.infoIcon,
                title: "Info",
              ),
              SizedBox(height: 25),
              CustomProfileItem(
                images: AppIcons.extraLinkIcon,
                title: "Help center",
              ),
              SizedBox(height: 25),
              CustomProfileItem(
                images: AppIcons.logOutIcon,
                title: "Log out",
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
