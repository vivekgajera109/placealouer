import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/model/onboarding_model.dart';

import '../../constant/app_colors.dart';

class OnboardingController extends GetxController {
  RxList<SliderModel> slides = <SliderModel>[].obs;
  RxInt currentIndex = 0.obs;

  // container created for dots
  buildDot(int index, BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex.value == index ? appWhiteColor : hintTextColor,
      ),
    );
  }
}
