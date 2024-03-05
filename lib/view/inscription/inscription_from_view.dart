import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/inscription/cgu/cgu_view.dart';
import 'package:placealouer/view/inscription/privacy_policy/privacy_policy.dart';
import 'package:placealouer/view/onboarding_screen/onboarding_screen.dart';

class InscriptionFormScreen extends StatelessWidget {
  const InscriptionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      isScial: true,
      isFooter: false,
      appBarTitle: "INSCRIPTION",
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
            hintText: "Prénom",
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          height15,
          textFormField(
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            hintText: "Nom",
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          height15,
          textFormField(
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            hintText: "Adresse email ou numéro de téléphone",
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          height15,
          textFormField(
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            hintText: "Mot de passe",
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          height15,
          textFormField(
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            hintText: "Confirmez le mot de passe",
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          height20,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'En validant votre inscription, vous\nacceptez les ',
              style: AppTextStyle.normalRegularBold15
                  .copyWith(color: appBlackColor),
              children: <TextSpan>[
                TextSpan(
                  text: 'conditions d’utilisation',
                  style: AppTextStyle.normalRegularBold15.copyWith(
                      decoration: TextDecoration.underline,
                      color: appBlackColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(() => const CguScreen());
                    },
                ),
              ],
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => const CguScreen());
                },
            ),
          ),
          height10,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Ainsi que la  ',
              style: AppTextStyle.normalRegularBold15
                  .copyWith(color: appBlackColor),
              children: <TextSpan>[
                TextSpan(
                    text: 'politique de confidentialité',
                    style: AppTextStyle.normalRegularBold15.copyWith(
                        decoration: TextDecoration.underline,
                        color: appBlackColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(
                          () => const PrivacyPolicy(),
                        );
                      }),
              ],
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(
                    () => const PrivacyPolicy(),
                  );
                },
            ),
          ),
          height20,
          CommonButton(
            title: "VALIDER",
            buttonColor: buttonColor,
            borderColor: buttonColor,
            titleColor: appWhiteColor,
            margin: const EdgeInsets.only(bottom: 10),
            onTap: () {
              Get.to(
                () => const OnboardingScreen(),
              );
            },
          ),
        ],
      ),
    );
  }
}
