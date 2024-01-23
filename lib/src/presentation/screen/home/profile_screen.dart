import 'package:breaking_news/src/core/constants/app_colors.dart';
import 'package:breaking_news/src/core/constants/app_icons.dart';
import 'package:breaking_news/src/core/dialog/info_dialog.dart';
import 'package:breaking_news/src/presentation/widget/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/dialog/help_center_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Switch theme",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                ),
                leading: const Image(
                  image: AssetImage(AppIcons.sunIcon),
                  height: 24,
                  color: AppColors.backgroundColor,
                ),
                tileColor: AppColors.whiteColor,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColors.blackColor,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                trailing: ValueListenableBuilder(
                  valueListenable: Hive.box("favorite").listenable(),
                  builder: (context, box, child) {
                    final isDark = box.get("theme", defaultValue: false);
                    return Switch(
                      onChanged: (value) async {
                        box.put("theme", value);
                      },
                      value: isDark,
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.029),
              CustomProfileItem(
                images: AppIcons.infoIcon,
                title: "Info",
                onPressed: () => infoDialog(context),
              ),
              SizedBox(height: size.height * 0.029),
              CustomProfileItem(
                onPressed: () => privacyPolicyDialog(
                  context,
                  () {
                    _launchUrl("https://t.me/erkinovv_dev");
                    Navigator.pop(context);
                  },
                ),
                images: AppIcons.extraLinkIcon,
                title: "Help center",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String uri) async {
  Uri uriLauncher = Uri.parse(uri);
  if (!await launchUrl(uriLauncher)) {
    throw Exception('Could not launch $uriLauncher');
  }
}
