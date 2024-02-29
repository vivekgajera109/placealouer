import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/dialog/common_dialog.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/message/chat/chat_screen.dart';
import 'package:placealouer/view/main_home/profile/user_profile/user_profile.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: Text(
            "Mes réservations",
            style: AppTextStyle.regularBold20,
          ),
          leading: false),
      body: ListView(
        children: [
          Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            color: containerColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 9),
              child: Column(
                children: [
                  Text(
                    "Totalisez 10 jours de location et recevez une boite à clefs sécurisée pour faciliter vos location",
                    style: AppTextStyle.regularBold15
                        .copyWith(color: appBlackColor),
                  ),
                  height20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0/10",
                        style: AppTextStyle.regularBold15
                            .copyWith(color: Colors.transparent),
                      ),
                      CommonButton(
                        onTap: () {
                          Get.to(() => const ChatScreen(
                                isAide: true,
                              ));
                        },
                        title: "Recevoir ma boite à clefs",
                        style: AppTextStyle.regularBold15
                            .copyWith(color: appWhiteColor),
                        height: 40,
                        borderColor: greenContainerColor,
                        buttonColor: greenContainerColor,
                        margin: EdgeInsets.zero,
                      ),
                      Text(
                        "0/10",
                        style: AppTextStyle.regularBold15
                            .copyWith(color: appBlackColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            color: containerColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 9),
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
                              child: Image.asset("assets/png/garage.png"),
                            ),
                            height05,
                            RatingBarIndicator(
                              itemSize: 22,
                              rating: 4,
                              itemBuilder: (context, index) => const Icon(
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
                            GestureDetector(
                              onTap: () {
                                dialogBuilder(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: redContainerColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Text(
                                  "Annuler la réservation",
                                  style: AppTextStyle.regularBold15,
                                ),
                              ),
                            ),
                            height20,
                            height20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  height20,
                  Text(
                    "Durée : Du lundi 18h au Mardi 18h",
                    style: AppTextStyle.regularBold15
                        .copyWith(color: appBlackColor),
                  ),
                  customHeight(30),
                  Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          onTap: () {
                            Get.to(() => const ChatScreen());
                          },
                          margin: EdgeInsets.zero,
                          style: AppTextStyle.regularBold15,
                          height: 35,
                          width: 0,
                          title: "Contacter",
                          borderColor: appBlackColor,
                          buttonColor: appBlackColor,
                          titleColor: appWhiteColor,
                        ),
                      ),
                      width15,
                      width15,
                      Expanded(
                        child: CommonButton(
                          onTap: () {},
                          margin: EdgeInsets.zero,
                          style: AppTextStyle.regularBold15,
                          height: 35,
                          width: 0,
                          title: "Itinéraire",
                          borderColor: appBlackColor,
                          buttonColor: appBlackColor,
                          titleColor: appWhiteColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          height20,
          Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            color: containerColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Durée : Du lundi 18h au Mardi 18h",
                          style: AppTextStyle.regularBold15
                              .copyWith(color: appBlackColor),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const UserProfile());
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 30,
                              backgroundImage: AssetImage(
                                "assets/png/pdp 1.png",
                              ),
                            ),
                            Text(
                              "Léa Dupond",
                              style: AppTextStyle.regularBold15.copyWith(
                                color: appBlackColor,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  height15,
                  CommonButton(
                    onTap: () {
                      Get.to(() => const ChatScreen());
                    },
                    margin: EdgeInsets.zero,
                    style: AppTextStyle.regularBold15,
                    height: 35,
                    width: 150,
                    title: "Contacter",
                    borderColor: appBlackColor,
                    buttonColor: appBlackColor,
                    titleColor: appWhiteColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
