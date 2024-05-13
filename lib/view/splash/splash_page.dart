import 'package:erp/config/constant.dart';
import 'package:erp/main.dart';
import 'package:erp/view/auth/login_page.dart';
import 'package:erp/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        child: Center(
          child: Image.asset(
            Assets.assetsIconsLogo2,
            width: Insets.exLarge * 6,
          ).animate(
            autoPlay: true,
            controller: controller,
            // onPlay: (controller) => controller.repeat(), // loop
            onComplete: (controller) {
              if (prefs.getString('token') == null) {
                Get.offAll(() => const LoginPage(),
                    transition: Transition.fadeIn);
              } else {
                Get.offAll(() => const HomePage(),
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
