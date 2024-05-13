import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(Assets.assetsImagesBackgroundLogin),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(Insets.exLarge * 1.5),
              Image.asset(
                Assets.assetsImagesLogo2,
                width: Insets.exLarge * 4,
              ),
              Gap(Insets.small),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.medium),
                child: Text(
                  'الشريك الرسمي لوزارة الاتصالات العراقية والمزود الأكبر للإنترنت الضوئي في واسط ',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: context.theme.colorScheme.surface,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
