import 'package:fiber/config/constant.dart';
import 'package:fiber/config/utils/const_class.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';

import '../../config/const_wodget/custom_chart_widget.dart';
import 'components/internet_chart_widget.dart';

class InternetUsagePage extends StatefulWidget {
  const InternetUsagePage({super.key});

  @override
  State<InternetUsagePage> createState() => _InternetUsagePageState();
}

class _InternetUsagePageState extends State<InternetUsagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leadingWidth: 70,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Insets.margin),
            const CustomBackButton(),
          ],
        ),
        title: Text(
          "استخدام البيانات",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Insets.margin),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(Insets.small),
              Text(
                "احصائيات شهرية",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(Insets.small),
              InternetChartWidget(),
              Gap(Insets.medium),
              Text(
                "استخدام اليوم",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(Insets.small),
              Row(
                children: [
                  Expanded(
                    child: CustomChartWidget(
                      title: "الرفع",
                      value: "0",
                      isRow: true,
                      color: Color(0xFF4F9AE0),
                      icon: CupertinoIcons.up_arrow,
                    ),
                  ),
                  Gap(Insets.small),
                  Expanded(
                      child: CustomChartWidget(
                    title: "التحميل",
                    value: "0",
                    isRow: true,
                    color: Color(0xFF4FE080),
                    icon: CupertinoIcons.down_arrow,
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
