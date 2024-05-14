import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/text_widgets/validator.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/auth_controller/auth_controller.dart';
import 'package:placealouer/utils/process_indicator.dart';
import 'package:placealouer/view/inscription/cgu/cgu_view.dart';
import 'package:placealouer/view/inscription/code/code_view.dart';
import 'package:placealouer/view/inscription/privacy_policy/privacy_policy.dart';

class InscriptionFormScreen extends StatefulWidget {
  const InscriptionFormScreen({super.key});

  @override
  State<InscriptionFormScreen> createState() => _InscriptionFormScreenState();
}

class _InscriptionFormScreenState extends State<InscriptionFormScreen> {
  AuthController authController = Get.put(AuthController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBackgroundAuth(
        isScial: true,
        isFooter: false,
        appBarTitle: "INSCRIPTION",
        child: Form(
          key: formKey,
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
                controller: authController.firstNameController,
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
                validator: (value) {
                  return Validators.validateText(text: "Prénom", value: value);
                },
              ),
              height15,
              textFormField(
                controller: authController.lastNameController,
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
                validator: (value) {
                  return Validators.validateText(text: "Nom", value: value);
                },
              ),
              height15,
              textFormField(
                controller: authController.emailController,
                contentPadding: const EdgeInsets.all(12),
                filledColor: textFormFieldColor,
                textStyle: AppTextStyle.normalRegularBold15
                    .copyWith(fontWeight: FontWeight.w500)
                    .copyWith(color: appBlackColor),
                hintText: "Adresse email",
                textAlign: TextAlign.center,
                hintStyle: AppTextStyle.normalRegularBold15
                    .copyWith(fontWeight: FontWeight.w500)
                    .copyWith(color: appBlackColor),
                borderRaduis: 50,
                validator: (value) {
                  return Validators.validateEmail(value!);
                },
              ),
              height15,
              textFormField(
                controller: authController.numberController,
                contentPadding: const EdgeInsets.all(12),
                filledColor: textFormFieldColor,
                textStyle: AppTextStyle.normalRegularBold15
                    .copyWith(fontWeight: FontWeight.w500)
                    .copyWith(color: appBlackColor),
                hintText: "Numéro de téléphone",
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return Validators.validateMobile(value!);
                },
                hintStyle: AppTextStyle.normalRegularBold15
                    .copyWith(fontWeight: FontWeight.w500)
                    .copyWith(color: appBlackColor),
                borderRaduis: 50,
              ),
              height15,
              textFormField(
                controller: authController.passwordController,
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
                validator: (value) {
                  return Validators.validatePassword(value!);
                },
              ),
              height15,
              textFormField(
                controller: authController.confirmPasswordController,
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
                validator: (value) {
                  return Validators.validatePassword(value!);
                },
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
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    Circle().show(context);
                    await authController.signUp(context).then(
                      (value) {
                        Circle().hide(context);
                        if (value == true) {
                          Get.offAll(
                            () => const CodeSreen(
                              inSingup: true,
                            ),
                          );
                        }
                        Circle().hide(context);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
