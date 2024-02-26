import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';

class TransfertScreen extends StatelessWidget {
  const TransfertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      appBarTitle: "Transfert",
      child: Column(children: [
        Text(
          "Veuillez remplir les informations suivantes :",
          style: AppTextStyle.normalSemiBold20.copyWith(
            color: appBlackColor,
          ),
          textAlign: TextAlign.center,
        ),
        height20,
        height10,
        textFormField(
          contentPadding: const EdgeInsets.all(12),
          filledColor: textFormFieldColor,
          hintText: "Iban",
          textStyle: AppTextStyle.normalRegularBold15
              .copyWith(fontWeight: FontWeight.w500)
              .copyWith(color: appBlackColor),
          textAlign: TextAlign.center,
          hintStyle: AppTextStyle.normalRegularBold15
              .copyWith(fontWeight: FontWeight.w500)
              .copyWith(color: appBlackColor),
          borderRaduis: 50,
        ),
        customHeight(50),
        CommonButton(
          onTap: () {
            Get.back();
          },
          title: "VALIDER",
          borderColor: buttonColor,
          buttonColor: buttonColor,
          titleColor: appWhiteColor,
        )
      ]),
    );
  }
}
