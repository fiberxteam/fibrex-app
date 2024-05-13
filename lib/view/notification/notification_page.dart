import 'package:erp/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 15,
              padding: EdgeInsets.all(Insets.medium),
              separatorBuilder: (context, index) => Gap(Insets.small),
              itemBuilder: (context, index) {
                return Container(
                  width: context.width,
                  padding: EdgeInsets.all(Insets.small),
                  decoration: BoxDecoration(
                    boxShadow: [defaultShadow],
                    color: Get.isDarkMode
                        ? context.theme.colorScheme.outline.withOpacity(0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(Insets.medium),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'the order didn’t placed please try again'.tr,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text('2024-14-10'.tr,
                        style: context.textTheme.labelSmall!.copyWith(
                            color: context.theme.colorScheme.outline)),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      child: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ].animate(interval: 50.ms).fadeIn(),
      ),
    );
  }
}
