import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/main_home.dart';
// #FF6060

class UnSuccessfulScreen extends StatelessWidget {
  const UnSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.offAll(() => const MainHome());
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/un_successful.json'),
            Text(
              "Échec du paiement...",
              style: AppTextStyle.regularBold20.copyWith(color: appBlackColor),
            ),
            height20,
            CommonButton(
              onTap: () {
                Get.offAll(() => const MainHome());
              },
              title: "Aller à la maison",
              buttonColor: unsuccessfulColor,
              borderColor: unsuccessfulColor,
              titleColor: appWhiteColor,
              margin: const EdgeInsets.only(bottom: 20),
            ),
          ],
        ),
      ),
    );
  }
}
