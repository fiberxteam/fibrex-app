import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_news_card.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Insets.exLarge + 24,
        ),
        CustomNewsCard(
          images: images,
          isNews: true,
        ),
      ],
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
