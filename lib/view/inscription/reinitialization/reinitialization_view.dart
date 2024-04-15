import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/auth_controller/auth_controller.dart';
import 'package:placealouer/common/background/common_background.dart';

class ReinitializationScreen extends StatefulWidget {
  const ReinitializationScreen({super.key});

  @override
  State<ReinitializationScreen> createState() => _ReinitializationScreenState();
}

class _ReinitializationScreenState extends State<ReinitializationScreen> {
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      appBarTitle: "RÉINITIALISATION",
      footerTitle: "Mentions légales",
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
            controller: authController.emailController,
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            hintText: "Adresse email",
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          customHeight(30),
          CommonButton(
            title: "VALIDER",
            buttonColor: buttonColor,
            borderColor: buttonColor,
            titleColor: appWhiteColor,
            margin: const EdgeInsets.only(bottom: 20),
            onTap: () {
              // Get.to(() => const CodeSreen());
              authController.forgotrPassword(context);
            },
          ),
        ],
      ),
    );
  }
}
