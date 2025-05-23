import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:flutter/material.dart';

class CustomWitchWidget extends StatelessWidget {
  final SetDataController controller;
  const CustomWitchWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (controller) => Switch(
        value: controller.isDark.value,
        thumbColor: WidgetStateProperty.all(
            context.theme.colorScheme.outline.withOpacity(0.5)),
        inactiveThumbColor: context.theme.colorScheme.outline.withOpacity(0.5),
        activeTrackColor: context.theme.colorScheme.outline.withOpacity(0.2),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        thumbIcon: controller.isDark.value
            ? null
            : const WidgetStatePropertyAll(Icon(Icons.sunny)),
        activeThumbImage: const AssetImage(Assets.assetsIconsMoon),
        inactiveThumbImage: const AssetImage(Assets.assetsIconsNotMoon),
        onChanged: (value) {
          controller.isDark.value = value;
          changeTheme(value);
        },
      ),
    );
  }
}
