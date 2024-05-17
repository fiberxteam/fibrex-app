import 'package:fiber/config/constant.dart';
import 'package:fiber/view/setting/components/custom_profile_card.dart';
import 'package:fiber/view/setting/components/custom_support_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Insets.exLarge + 24,
          ),
          const CustomProfileCard(),
          SizedBox(
            height: Insets.medium,
          ),
          Text(
            'الدعم'.tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: Insets.small,
          ),
          const CustomSupportCard(),
          SizedBox(
            height: Insets.medium,
          ),
          Text(
            'الملف الشخصي'.tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: Insets.small,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.comfortable,
            enableFeedback: false,
            minVerticalPadding: 0,
            titleAlignment: ListTileTitleAlignment.center,
            style: ListTileStyle.list,
            horizontalTitleGap: Insets.small,
            title: Text(
              'تغيير كلمة السر'.tr,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
            leading: SvgPicture.asset(
              Assets.assetsIconsPassword,
              width: 24,
              height: 24,
            ),
            trailing: SvgPicture.asset(
              Assets.assetsIconsCaretRight,
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(
            height: Insets.medium,
          ),
          Text(
            'الحساب'.tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: Insets.small,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.comfortable,
            enableFeedback: false,
            minVerticalPadding: 0,
            titleAlignment: ListTileTitleAlignment.center,
            style: ListTileStyle.list,
            horizontalTitleGap: Insets.small,
            title: Text(
              'تسجيل الخروج'.tr,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
            leading: SvgPicture.asset(
              Assets.assetsIconsSignIn,
              width: 24,
              height: 24,
            ),
            trailing: SvgPicture.asset(
              Assets.assetsIconsCaretRight,
              width: 24,
              height: 24,
              color: context.theme.colorScheme.error,
            ),
          ),
        ].animate(interval: 50.ms).fade(),
      ),
    );
  }
}
