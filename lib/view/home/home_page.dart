import 'package:fiber/config/constant.dart';
import 'package:fiber/view/home/components/custom_app_bar.dart';
import 'package:fiber/view/home/components/custom_sub_scribe_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Insets.exLarge * 1.2),
        const CustomAppBar(),
        SizedBox(height: Insets.medium),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.small),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSubScribeWidget(),
            ],
          ),
        )
      ].animate(interval: 50.ms).fadeIn(),
    );
  }
}
