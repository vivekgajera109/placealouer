import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/mes_annonces_controller/mes_annonces_controller.dart';
import 'package:placealouer/view/main_home/profile/publier_une_annonce/publier_une_annonce.dart';

class MesAnnoncesScreen extends StatefulWidget {
  const MesAnnoncesScreen({super.key});

  @override
  State<MesAnnoncesScreen> createState() => _MesAnnoncesScreenState();
}

class _MesAnnoncesScreenState extends State<MesAnnoncesScreen> {
  MesAnnoncesController mesAnnoncesController =
      Get.put(MesAnnoncesController());
  @override
  Widget build(BuildContext context) {
    return CommonBackground(
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
                Text(
                  "Mes Annonces",
                  style: AppTextStyle.regularBold30,
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
              child: Container(
                height: Get.height,
                width: Get.width,
                color: appWhiteColor,
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 9,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 96,
                                      width: 128,
                                      decoration: BoxDecoration(
                                        color: appWhiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:
                                          Image.asset("assets/png/garage.png"),
                                    ),
                                    height05,
                                    RatingBarIndicator(
                                      itemSize: 22,
                                      rating: 4,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              width15,
                              width05,
                              Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Obx(() {
                                      return GestureDetector(
                                        onTap: () {
                                          mesAnnoncesController.isActive.value =
                                              !mesAnnoncesController
                                                  .isActive.value;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: mesAnnoncesController
                                                    .isActive.value
                                                ? greenContainerColor
                                                : redContainerColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          child: Text(
                                            mesAnnoncesController.isActive.value
                                                ? "Réactiver l’annonce"
                                                : "Désactiver l’annonce",
                                            style: AppTextStyle.regularBold15,
                                          ),
                                        ),
                                      );
                                    }),
                                    height20,
                                    height20,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset(
                                          "assets/png/code_1.png",
                                          height: 32,
                                        ),
                                        SvgPicture.asset(
                                          "assets/svg/alarm.svg",
                                          height: 22,
                                        ),
                                        SvgPicture.asset(
                                          "assets/svg/plug.svg",
                                          height: 22,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          height20,
                          Text(
                            "Code : XXXXX",
                            style: AppTextStyle.regularBold15
                                .copyWith(color: appBlackColor),
                          ),
                          customHeight(30),
                          Align(
                            alignment: Alignment.center,
                            child: CommonButton(
                              onTap: () {
                                Get.to(() => PublierUneAnnonce());
                              },
                              margin: EdgeInsets.zero,
                              style: AppTextStyle.regularBold15,
                              height: 35,
                              title: "Modifier l’annonce",
                              borderColor: appBlackColor,
                              buttonColor: appBlackColor,
                              titleColor: appWhiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
