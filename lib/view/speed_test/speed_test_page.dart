import 'package:fiber/config/const_wodget/custom_chart_widget.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SfRadialGauge(
              title: const GaugeTitle(
                  text: '',
                  textStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 150,
                  axisLabelStyle: const GaugeTextStyle(
                    color: Colors.red,
                  ),
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Colors.yellow,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 100,
                        endValue: 150,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10)
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                        value: 1,
                        enableAnimation: true,
                        needleColor: context.theme.colorScheme.primary)
                  ],
                  annotations: [
                    GaugeAnnotation(
                        widget: Text(
                          '0 Mbps',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                        angle: 88,
                        positionFactor: 0.8)
                  ],
                )
              ],
            ),
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
            SizedBox(height: Insets.exLarge * 2.5),
          ].animate(interval: 50.ms).fadeIn(),
        ),
      ),
      floatingActionButton: Container(
        width: context.width,
        height: 50,
        margin: EdgeInsets.all(Insets.small),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Insets.large),
            ),
          ),
          child: Text(
            "بدء الفحص".tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
