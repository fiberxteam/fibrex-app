import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_news_card.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leadingWidth: 65,
        title: Text(
          "اخر الاخبار",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          CustomNewsCard(
            images: images,
            isNews: true,
          ),
        ],
      ),
    );
  }

  List<String> images = [
    Assets.assetsImagesImage1,
    Assets.assetsImagesImage2,
    Assets.assetsImagesImage1,
    Assets.assetsImagesImage2,
    Assets.assetsImagesImage1,
    Assets.assetsImagesImage2,
  ];
}
