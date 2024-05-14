import 'package:fiber/config/constant.dart';

class CustomServiceCard extends StatelessWidget {
  final String icon;
  final String title;
  const CustomServiceCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: Insets.exLarge * 2.7,
        padding: EdgeInsets.symmetric(
            horizontal: Insets.small, vertical: Insets.exSmall),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface.withOpacity(0.5),
          border: Border.all(
            color: context.theme.colorScheme.surface,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(Insets.small),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Insets.large * 1.3,
              width: Insets.large * 1.3,
              padding: EdgeInsets.all(Insets.small - 3),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                icon,
                color: context.theme.colorScheme.primary,
              ),
            ),
            SizedBox(height: Insets.small),
            Text(title,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleSmall!.copyWith(
                  color: context.theme.colorScheme.scrim,
                )),
          ],
        ),
      ),
    );
  }
}
