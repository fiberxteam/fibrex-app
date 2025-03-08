import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/home/home_controller.dart';
import 'package:fiber/controller/sas/sas_controller.dart';
import 'package:fiber/models/service_model.dart';
import 'package:fiber/view/home/components/custom_add_to_wallet.dart';
import 'package:fiber/view/home/components/custom_subscription_info.dart';
import 'package:flutter/material.dart';

class CustomSubScribeWidget extends StatelessWidget {
  final ServiceModel serviceModel;
  const CustomSubScribeWidget({super.key, required this.serviceModel});

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
                  color: serviceModel.subscriptionStatus?.status ?? false
                      ? Colors.green.shade500
                      : Colors.red.shade500,
                  borderRadius: BorderRadius.circular(Insets.medium),
                ),
                child: Text(
                  serviceModel.subscriptionStatus?.status ?? false
                      ? "فعال"
                      : "غير فعال",
                  style: context.theme.textTheme.labelMedium!.copyWith(
                    color: context.theme.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            serviceModel.profileName ?? "معلومات غير متوفرة",
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
                      subtitle: serviceModel.price != null
                          ? formatCurrency(int.parse(serviceModel.price!.toString()))
                          : "غير متوفر",
                    ),
                    Obx(() {
                      int remainingDays = Get.find<HomeController>()
                          .dashboardModel
                          .value
                          .remainingDays ?? 0; // Use 0 if remainingDays is null
                      return CustomSubscriptionInfo(
                        icon: Assets.assetsIconsCalendarCheck,
                        title: 'المدة المتبقية'.tr,
                        subtitle: remainingDays <= 0 ? "0" : remainingDays.toString(),
                      );
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSubscriptionInfo(
                      icon: Assets.assetsIconsCalendarX,
                      title: 'تاريخ الانتهاء'.tr,
                      subtitle: serviceModel.expiration != null
                          ? makeDate(serviceModel.expiration)
                          : "غير محدد",
                    ),
                    Obx(
                          () => CustomSubscriptionInfo(
                        icon: Assets.assetsIconsWallet,
                        title: 'المحفظة'.tr,
                        subtitle: Get.find<HomeController>()
                            .userInfo
                            .value
                            .balance !=
                            0.0
                            ? formatCurrency(int.parse(Get.find<HomeController>()
                            .userInfo
                            .value
                            .balance
                            .toString()))
                            : "غير متوفر",
                      ),
                    )
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
