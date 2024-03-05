import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/profile/select_car/select_car_screen.dart';
import 'package:placealouer/view/verify_identity/verify_identity_screen.dart';

class PublierUneAnnonce extends StatelessWidget {
  const PublierUneAnnonce({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      // appBarTitle: 'Publier une annonce',
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: appWhiteColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Publier une annonce",
                    style: AppTextStyle.regularBold30.copyWith(fontSize: 22),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        commonCard(
                          color: containerColor,
                          title: "Ajouter une photo",
                          onTap: () {},
                        ),
                        commonCard(
                          color: containerColor,
                          title: "Ajouter une photo",
                          onTap: () {},
                        ),
                      ],
                    ),
                    height20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        commonCard(
                          color: containerColor,
                          title: "Ajouter une photo",
                          onTap: () {},
                        ),
                        commonCard(
                          color: containerColor,
                          title: "Ajouter une photo",
                          onTap: () {},
                        ),
                      ],
                    ),
                    customHeight(30),
                    textFormField(
                      contentPadding: const EdgeInsets.all(12),
                      filledColor: containerColor,
                      hintText: "Donnez un titre à votre annonce",
                      textStyle: AppTextStyle.regularBold15
                          .copyWith(color: appBlackColor),
                      hintStyle: AppTextStyle.regularBold15
                          .copyWith(color: appBlackColor),
                      borderRaduis: 10,
                    ),
                    height20,
                    textFormField(
                      contentPadding: const EdgeInsets.all(12),
                      filledColor: containerColor,
                      hintText: "Indiquez votre adresse",
                      textStyle: AppTextStyle.regularBold15
                          .copyWith(color: appBlackColor),
                      hintStyle: AppTextStyle.regularBold15
                          .copyWith(color: appBlackColor),
                      borderRaduis: 10,
                    ),
                    height20,
                    textFormField(
                      contentPadding: const EdgeInsets.all(12),
                      filledColor: containerColor,
                      hintText: "Ajouter une description à votre annonce",
                      textStyle: AppTextStyle.regularBold15
                          .copyWith(color: appBlackColor),
                      hintStyle: AppTextStyle.regularBold15
                          .copyWith(color: appBlackColor),
                      borderRaduis: 10,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
            height10,
            CommonButton(
                onTap: () {
                  Get.to(() => const SelectCarScreen());
                },
                title: "Continuer",
                margin: const EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
    );
  }
}
