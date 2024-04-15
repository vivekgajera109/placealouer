import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/main.dart';
import 'package:placealouer/view/inscription/inscription_view.dart';
import 'package:placealouer/view/main_home/main_home.dart';

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
        log("---->> ${box.read("token")}");
        box.read("token") == null
            ? Get.offAll(() => const InscriptionScreeen())
            : Get.offAll(() => const MainHome());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/png/app_icon.png",
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
