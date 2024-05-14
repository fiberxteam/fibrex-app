import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_app_bar.dart';
import 'package:fiber/view/home/components/custom_offers_card.dart';
import 'package:fiber/view/home/components/custom_service_card.dart';
import 'package:fiber/view/home/components/custom_sub_scribe_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
          SizedBox(height: Insets.exLarge * 1.2),
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
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
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
                  icon: Assets.assetsIconsReceipts,
                  title: 'الفواتير'.tr,
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
                  icon: Assets.assetsIconsHandCoins,
                  title: 'الباقات'.tr,
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
                  icon: Assets.assetsIconsWifiX,
                  title: 'الصيانة'.tr,
                ),
                SizedBox(width: Insets.small),
                CustomServiceCard(
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
          AspectRatio(
            aspectRatio: 12 / 9,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: Insets.small),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (context, index) =>
                  SizedBox(width: Insets.small),
              itemBuilder: (context, index) {
                return Container(
                  width: context.width * 0.6,
                  padding: EdgeInsets.all(Insets.small),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(Insets.medium),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 13 / 9,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Insets.small),
                          ),
                          child: Image.asset(
                            images[index],
                            width: context.width * 0.6,
                            height: context.height * 0.3,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: Insets.small),
                      Text(
                        'آخر تحديثات الكيمنك!',
                        style: context.theme.textTheme.titleSmall!.copyWith(
                          color: context.theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Insets.exSmall),
                      Text(
                        'باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.',
                        style: context.theme.textTheme.labelSmall!.copyWith(
                          color: context.theme.colorScheme.outline,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
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
