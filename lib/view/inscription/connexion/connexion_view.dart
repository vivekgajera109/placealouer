import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/inscription/reinitialization/reinitialization_view.dart';
import 'package:placealouer/view/onboarding_screen/onboarding_screen.dart';
import 'package:placealouer/common/background/common_background.dart';

class ConnexionScreen extends StatelessWidget {
  const ConnexionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      footerTitle: "Mentions légales",
      isScial: true,
      appBarTitle: "CONNEXION",
      child: Column(
        children: [
          Text(
            "Veuillez remplir les informations suivantes :",
            style: AppTextStyle.normalSemiBold20.copyWith(
              color: appBlackColor,
            ),
            textAlign: TextAlign.center,
          ),
          height20,
          textFormField(
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            hintText: "Adresse email ou numéro de téléphone",
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          height20,
          textFormField(
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            hintText: "Mot de passe",
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          height10,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const ReinitializationScreen());
              },
              child: Text(
                "Mot de passe oublié?",
                style: AppTextStyle.normalSemiBold15.copyWith(
                  color: appBlackColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          customHeight(30),
          CommonButton(
            title: "VALIDER",
            buttonColor: buttonColor,
            borderColor: buttonColor,
            titleColor: appWhiteColor,
            margin: const EdgeInsets.only(bottom: 20),
            onTap: () {
              Get.to(() => const OnboardingScreen());
            },
          ),
        ],
      ),
    );
  }
}
