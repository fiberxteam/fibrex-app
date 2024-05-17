import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_app_bar.dart';
import 'package:fiber/view/home/components/custom_news_card.dart';
import 'package:fiber/view/home/components/custom_offers_card.dart';
import 'package:fiber/view/home/components/custom_renew_subscription_card.dart';
import 'package:fiber/view/home/components/custom_service_card.dart';
import 'package:fiber/view/home/components/custom_sub_scribe_widget.dart';
import 'package:fiber/view/plans/plans_page.dart';
import 'package:fiber/view/service/pages/receipts.dart';
import 'package:fiber/view/setting/pages/support.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../internet_usage/internet_usage_page.dart';
import '../speed_test/speed_test_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Insets.exLarge),
          const CustomAppBar(),
          SizedBox(height: Insets.small),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            child: const CustomSubScribeWidget(),
          ),
          SizedBox(height: Insets.medium),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            child: Text(
              'الخدمات'.tr,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.scrim,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: Insets.small),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            child: Row(
              children: [
                CustomServiceCard(
                  icon: Assets.assetsIconsArrowsClockwise,
                  title: 'تجديد إشتراك'.tr,
                  onTap: () {
                    customBottomSheet(
                      context,
                      height: context.height * 0.6,
                      child: const SingleChildScrollView(
                        child: CustomRenewSubscriptionCard(),
                      ),
                    );
                  },
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
                  onTap: () => {Get.to(const SpeedTestPage())},
                  icon: Assets.assetsIconsSpeedometer,
                  title: 'فحص السرعة'.tr,
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
                  icon: Assets.assetsIconsMapPin,
                  title: 'مواقعنا والتغطية'.tr,
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
                  onTap: () {
                    Get.to(const InternetUsagePage());
                  },
                  icon: Assets.assetsIconsChartLine,
                  title: 'استخدام البيانات'.tr,
                )
              ],
            ),
          ),
          SizedBox(height: Insets.small),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            child: Row(
              children: [
                CustomServiceCard(
                  onTap: () {
                    Get.to(
                      () => const ReceiptsPage(),
                      transition: Transition.fadeIn,
                    );
                  },
                  icon: Assets.assetsIconsReceipts,
                  title: 'الفواتير'.tr,
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
                  icon: Assets.assetsIconsHandCoins,
                  title: 'الباقات'.tr,
                  onTap: () {
                    Get.to(() => const PlansPage(),
                        transition: Transition.fadeIn);
                  },
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
                  icon: Assets.assetsIconsWifiX,
                  title: 'الصيانة'.tr,
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
                  onTap: () {
                    Get.to(() => const SupportPage(),
                        transition: Transition.fadeIn);
                  },
                  icon: Assets.assetsIconsHeadset,
                  title: 'الدعم'.tr,
                )
              ],
            ),
          ),
          SizedBox(height: Insets.medium),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            child: Text(
              'العروض'.tr,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.scrim,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: Insets.small),
          CustomOffersCard(images: images),
          SizedBox(height: Insets.medium),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            child: Text(
              'آخر الأخبار'.tr,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.scrim,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: Insets.small),
          CustomNewsCard(images: images),
          SizedBox(height: Insets.exLarge * 2.5),
        ].animate(interval: 30.ms).fadeIn(),
      ),
    );
  }

  List<String> images = [
    Assets.assetsImagesImage1,
    Assets.assetsImagesImage2,
  ];
}
