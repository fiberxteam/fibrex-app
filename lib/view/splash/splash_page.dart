import 'package:fiber/config/constant.dart';
import 'package:fiber/main.dart';
import 'package:fiber/view/auth/login_page.dart';
import 'package:fiber/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../navigation/navigation_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesBackgroundSplash),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            Assets.assetsImagesLogo,
            width: Insets.exLarge * 6,
          ).animate(
            autoPlay: true,
            controller: controller,
            onComplete: (controller) {
              if (prefs.getString('token') == null) {
                Get.offAll(() => const LoginPage(),
                    transition: Transition.fadeIn);
              } else {
                Get.offAll(() => const NavigationPage(),
                    transition: Transition.fadeIn);
              }
            },
            effects: [
              FadeEffect(duration: 1000.ms, curve: Curves.easeOut),
              MoveEffect(
                duration: 1200.ms,
                curve: Curves.easeInSine,
                begin: const Offset(0, -50),
                end: const Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimationController get controller => AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      );
}
