import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/view/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAll(() => const OnboardingScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Image.asset("assets/png/app_icon.png"),
    );
  }
}

class CommonBackground extends StatelessWidget {
  final Widget? child;
  const CommonBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/png/Background.png",
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: child,
      ),
    );
  }
}
