import 'package:fiber/config/constant.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NewsInfo extends StatefulWidget {
  final String id;
  const NewsInfo({super.key, required this.id});

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
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
          "تفاصيل الخبر".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Insets.small),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.id,
                child: AspectRatio(
                  aspectRatio: 12 / 9,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Insets.medium),
                    ),
                    child: Image.asset(
                      Assets.assetsImagesImage1,
                      width: context.width * 0.6,
                      height: context.height * 0.3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Insets.medium),
              Text(
                'آخر تحديثات الكيمنك!',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: Insets.exSmall),
              Text(
                '1-1-2024، الاحد',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              SizedBox(height: Insets.small),
              Text(
                'باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.باقات فايبر أكس تقدم مجموعة خدمات متنوعة من الباقات المُصممة لتلبية احتياجات العملاء ، موفرة إنترنت عالي السرعة مع ميزات وفوائد مختلفة.',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              SizedBox(height: Insets.exLarge),
            ].animate(interval: 50.ms).fade(),
          ),
        ),
      ),
    );
  }
}
