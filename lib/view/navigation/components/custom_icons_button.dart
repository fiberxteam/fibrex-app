import 'package:fiber/config/constant.dart';

class CustomIconsButton extends StatelessWidget {
  final String? icon;
  final Widget? iconWidget;
  final String? title;
  const CustomIconsButton({
    super.key,
    this.icon,
    this.iconWidget,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Insets.large + 5,
            height: Insets.large + 5,
            decoration: BoxDecoration(
              border: Border.all(color: context.theme.colorScheme.outline),
              shape: BoxShape.circle,
            ),
            child: iconWidget ??
                SvgPicture.asset(icon!,
                    color: context.theme.colorScheme.outline),
          ),
          Gap(Insets.exSmall - 2),
          Text(
            title ?? '-',
            style: context.theme.textTheme.labelMedium!
                .copyWith(color: context.theme.colorScheme.outline),
          ),
        ],
      ),
    );
  }
}
