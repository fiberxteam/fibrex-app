import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_subscription_info.dart';
import 'package:flutter/material.dart';

class CustomSubScribeWidget extends StatelessWidget {
  const CustomSubScribeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(Insets.medium),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.theme.colorScheme.onPrimaryContainer.withOpacity(0.8),
            context.theme.colorScheme.primary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        image: const DecorationImage(
          image: AssetImage(Assets.assetsImagesSubscripe),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(Insets.large),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'نوع الاشتراك'.tr,
                style: context.theme.textTheme.labelMedium!.copyWith(
                  color: context.theme.colorScheme.surface,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.large,
                  vertical: Insets.exSmall,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(Insets.medium),
                ),
                child: Text(
                  'فعال'.tr,
                  style: context.theme.textTheme.labelMedium!.copyWith(
                    color: context.theme.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'أكسبرس',
            style: context.theme.textTheme.headlineMedium!.copyWith(
              color: context.theme.colorScheme.surface,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(Insets.exSmall),
          SizedBox(
            width: context.width * 0.8,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSubscriptionInfo(
                      icon: Assets.assetsIconsMoney,
                      title: 'السعر'.tr,
                      subtitle: '50,000',
                    ),
                    CustomSubscriptionInfo(
                      icon: Assets.assetsIconsCalendarCheck,
                      title: 'المدة المتبقية'.tr,
                      subtitle: '30 يوم',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSubscriptionInfo(
                      icon: Assets.assetsIconsCalendarCheck,
                      title: 'تاريخ الإشتراك'.tr,
                      subtitle: '11-5-2024',
                    ),
                    CustomSubscriptionInfo(
                      icon: Assets.assetsIconsCalendarX,
                      title: 'تاريخ الانتهاء'.tr,
                      subtitle: '11-5-2024',
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
