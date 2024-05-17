import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(Insets.large),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: Insets.small,
        title: Text(
          'علي جاسب كاظم',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '07706968056',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.theme.colorScheme.outline),
        ),
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(Assets.assetsImagesImage1),
        ),
      ),
    );
  }
}
