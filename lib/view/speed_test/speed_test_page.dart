import 'package:fiber/config/const_wodget/custom_chart_widget.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class SpeedTestPage extends StatefulWidget {
  const SpeedTestPage({super.key});

  @override
  State<SpeedTestPage> createState() => _SpeedTestPageState();
}

class _SpeedTestPageState extends State<SpeedTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leadingWidth: 65,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Insets.margin),
            const CustomBackButton(),
          ],
        ),
        title: Text(
          "فحص السرعة".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(Insets.small),
            child: CustomChartWidget(
              title: "التحميل".tr,
              value: "0",
              color: const Color(0xFF4FE080),
              icon: CupertinoIcons.down_arrow,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Insets.small),
            child: CustomChartWidget(
              title: "الرفع".tr,
              value: "0",
              color: const Color.fromARGB(255, 79, 108, 224),
              icon: CupertinoIcons.up_arrow,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Insets.small),
            child: CustomChartWidget(
              title: "الإستجابة".tr,
              value: "0",
              color: const Color.fromARGB(255, 224, 79, 79),
              icon: CupertinoIcons.wifi,
            ),
          ),
        ],
      ),
    );
  }
}
