import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/inscription/connexion/connexion_view.dart';
import 'package:placealouer/view/inscription/inscription_from_view.dart';
import 'package:placealouer/common/background/common_background.dart';

class InscriptionScreeen extends StatefulWidget {
  const InscriptionScreeen({super.key});

  @override
  State<InscriptionScreeen> createState() => _InscriptionScreeenState();
}

class _InscriptionScreeenState extends State<InscriptionScreeen> {
  @override
  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/png/app_icon.png",
              height: 250,
            ),
            customHeight(50),
            CommonButton(
              onTap: () {
                Get.to(
                  () => const InscriptionFormScreen(),
                );
              },
              title: "INSCRIPTION",
              borderColor: appWhiteColor,
              style: AppTextStyle.normalRegularBold20.copyWith(
                color: appBlackColor,
              ),
              margin: const EdgeInsets.symmetric(vertical: 20),
            ),
            RichText(
              text: TextSpan(
                text: 'Déjà un compte ?  ',
                style: AppTextStyle.normalRegularBold15,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Connectez-vous',
                    style: AppTextStyle.normalRegularBold15.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(
                          () => const ConnexionScreen(),
                        );
                      },
                  ),
                ],
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(
                      () => const ConnexionScreen(),
                    );
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
