import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_renew_card_item.dart';
import 'package:flutter/material.dart';

class CustomRenewSubscriptionCard extends StatelessWidget {
  const CustomRenewSubscriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اختار الباقة'.tr,
            style: context.theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(Insets.medium),
          const CustomRenewCardItem(
            title: 'فايبر أكس / 40Mbps',
            prices: 5000,
            isActive: true,
          ),
          Gap(Insets.small),
          const CustomRenewCardItem(
            title: 'فايبر أكس / 40Mbps',
            prices: 5000,
            isActive: false,
          ),
          Gap(Insets.small),
          const CustomRenewCardItem(
            title: 'فايبر أكس / 40Mbps',
            prices: 5000,
            isActive: false,
          )
        ],
      ),
    );
  }
}
