import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class PlanCardWidget extends StatelessWidget {
  const PlanCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.margin),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: Insets.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Insets.large),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.large),
                image: DecorationImage(
                    image: AssetImage(Assets.assetsImagesImage1),
                    fit: BoxFit.cover)),
          ),
          Gap(Insets.medium),
          Text(
            "فايبر اكس / 40Mps",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          Gap(Insets.exSmall),
          Text(
            "سرعة تحميل وتنزيل 35 ميجابت في الثانية ربط أكثر من 10 أجهزة في وقت واحد سرعة جيدة في الألعاب عبر الإنترنت أقل زمن وصول (Ping) إنترنت آمن ومأمون خدمات الهاتف الثابت عبر بروتوكول الإنترنت (voIP).",
            style: TextStyle(color: Color(0xFF7C758A)),
          ),
          Gap(Insets.small),
          Text(
            "35,000 د.ع",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
