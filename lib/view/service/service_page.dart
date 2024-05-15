import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_renew_subscription_card.dart';
import 'package:fiber/view/home/components/custom_service_card.dart';
import 'package:fiber/view/plans/plans_page.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: Insets.exLarge + Insets.medium + 5),
          CustomServiceCard(
            icon: Assets.assetsIconsArrowsClockwise,
            title: 'تجديد إشتراك'.tr,
            servicePage: true,
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
          SizedBox(height: Insets.small),
          CustomServiceCard(
            servicePage: true,
            icon: Assets.assetsIconsSpeedometer,
            title: 'فحص السرعة'.tr,
          ),
          SizedBox(height: Insets.small),
          CustomServiceCard(
            servicePage: true,
            icon: Assets.assetsIconsMapPin,
            title: 'مواقعنا والتغطية'.tr,
          ),
          SizedBox(height: Insets.small),
          CustomServiceCard(
            servicePage: true,
            icon: Assets.assetsIconsChartLine,
            title: 'استخدام البيانات'.tr,
          ),
          SizedBox(height: Insets.small),
          CustomServiceCard(
            servicePage: true,
            icon: Assets.assetsIconsReceipts,
            title: 'الفواتير'.tr,
          ),
          SizedBox(height: Insets.small),
          CustomServiceCard(
            servicePage: true,
            icon: Assets.assetsIconsHandCoins,
            title: 'الباقات'.tr,
            onTap: () {
              Get.to(const PlansPage());
            },
          ),
          SizedBox(height: Insets.small),
          CustomServiceCard(
            servicePage: true,
            icon: Assets.assetsIconsWifiX,
            title: 'الصيانة'.tr,
          ),
          SizedBox(height: Insets.small),
          CustomServiceCard(
            servicePage: true,
            icon: Assets.assetsIconsHeadset,
            title: 'الدعم'.tr,
          )
        ].animate(interval: 20.ms).fade(),
      ),
    );
  }
}
