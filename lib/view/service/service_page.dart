import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_renew_subscription_card.dart';
import 'package:fiber/view/home/components/custom_service_card.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Insets.exLarge + Insets.medium),
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
      ],
    );
  }
}
