import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:placealouer/common/text_widgets/validator.dart';
// import 'package:pinput/pinput.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/auth_controller/auth_controller.dart';
import 'package:placealouer/common/background/common_background.dart';

class CodeSreen extends StatefulWidget {
  const CodeSreen({super.key});

  @override
  State<CodeSreen> createState() => _CodeSreenState();
}

class _CodeSreenState extends State<CodeSreen> {
  AuthController authController = Get.find<AuthController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      footerTitle: "Mentions légales",
      appBarTitle: "CODE",
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              "Saisissez le code reçu",
              style: AppTextStyle.normalSemiBold20.copyWith(
                color: appBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
            height20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PinCodeTextField(
                validator: (value) {
                  return Validators.validateDigits(value!, "kirjoita otp", 4);
                },
                appContext: context,
                controller: authController.otpController,
                length: 4,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(35),
                  fieldHeight: 50,
                  fieldWidth: 60,
                  activeColor: hintTextColor,
                  inactiveColor: hintTextColor,
                  inactiveFillColor: hintTextColor,
                  selectedFillColor: hintTextColor,
                  activeFillColor: hintTextColor,
                  selectedColor: hintTextColor,
                  disabledColor: hintTextColor,
                  errorBorderColor: Colors.red,
                ),
              ),
            ),
            height10,
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Renvoyer le code",
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
                if (formKey.currentState!.validate())
                // Get.to(() => const ReReinitializationScreen());
                {
                  authController.otpVerification(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
