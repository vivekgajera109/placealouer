// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/controller/onboarding_controller/onboarding_controller.dart';
import 'package:placealouer/model/onboarding_model.dart';
import 'package:placealouer/view/onboarding_screen/slider.dart';
import 'package:placealouer/view/splash_screen/splash_screen.dart';
import 'package:placealouer/view/verify_identity/verify_identity_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? controller;
  OnboardingController onboardingController = Get.put(OnboardingController());
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    onboardingController.slides.value = getSlides();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    onboardingController.currentIndex.value = value;
                  });
                },
                itemCount: onboardingController.slides.length,
                itemBuilder: (context, index) {
                  // contents of slider
                  return CustomSlider(
                    image: onboardingController.slides[index].getImage() ?? "",
                    title: onboardingController.slides[index].getTitle() ?? "",
                    subTitle:
                        onboardingController.slides[index].getSubTitle() ?? "",
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingController.slides.length,
              (index) => onboardingController.buildDot(index, context),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                if (onboardingController.currentIndex.value ==
                    onboardingController.slides.length - 1) {
                  Get.to(
                    () => const VerifyIdentity(),
                  );
                }
                controller?.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 40,
                color: appWhiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
