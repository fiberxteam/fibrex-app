import 'package:fiber/config/constant.dart';

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
            'إعادة التعبئة'.tr,
            style: context.theme.textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
