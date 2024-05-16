import 'package:fiber/config/const_wodget/custom_chart_widget.dart';
import 'package:fiber/config/constant.dart';
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
          title: Text("data"),
        ),
        body: Padding(
          padding: EdgeInsets.all(Insets.medium),
          child: CustomChartWidget(
            title: "التحميل",
            value: "0",
            color: Color(0xFF4FE080),
            icon: CupertinoIcons.down_arrow,
          ),
        ));
  }
}
