import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/view/inscription/inscription_view.dart';

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
      const Duration(seconds: 5),
      () {
        // Get.offAll(() => const OnboardingScreen());
        Get.offAll(() => const InscriptionScreeen());
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
