import 'package:fiber/config/constant.dart';
import 'package:fiber/config/utils/const_class.dart';
import 'package:fiber/view/navigation/components/custom_icons_button.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesBg),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'NavigationPage is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: context.width,
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: Insets.small),
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.exSmall),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          border:
              Border.all(color: context.theme.colorScheme.secondaryContainer),
          borderRadius: BorderRadius.circular(Insets.large),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconsButton(
              title: 'الرئيسية'.tr,
              iconWidget: Icon(
                CupertinoIcons.home,
                size: Insets.medium - 2,
                color: context.theme.colorScheme.outline,
              ),
            ),
            CustomIconsButton(
              title: 'الخدمات'.tr,
              icon: Assets.assetsIconsService,
            ),
            CustomIconsButton(
              title: 'الأخبار'.tr,
              icon: Assets.assetsIconsNews,
            ),
            CustomIconsButton(
              title: 'الاعدادات'.tr,
              iconWidget: Icon(
                CupertinoIcons.settings,
                size: Insets.medium - 2,
                color: context.theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
