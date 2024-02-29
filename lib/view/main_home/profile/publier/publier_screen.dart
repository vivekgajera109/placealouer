import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/message/book/book_screen.dart';
import 'package:placealouer/view/main_home/profile/publier_une_annonce/publier_une_annonce.dart';

class PublierScreen extends StatelessWidget {
  const PublierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          height05,
          Row(
            children: [
              const Expanded(
                  child: Divider(
                color: appBlackColor,
              )),
              width10,
              Text(
                "Selectionnez vos filtres",
                style: AppTextStyle.normalSemiBold15.copyWith(
                  color: appBlackColor,
                ),
              ),
              width10,
              const Expanded(
                  child: Divider(
                color: appBlackColor,
              )),
            ],
          ),
          customHeight(30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const PublierUneAnnonce());
                  },
                  child: Card(
                    color: containerColor,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 35.0, horizontal: 60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mettre ma place en location\n",
                            style: AppTextStyle.normalSemiBold20
                                .copyWith(color: appBlackColor),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const BookScreen());
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: containerColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 35.0, horizontal: 60),
                      child: Text(
                        "Planifier une demande de place (appel d’offre)",
                        style: AppTextStyle.normalSemiBold20
                            .copyWith(color: appBlackColor),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
