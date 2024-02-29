import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/message/book/book_screen.dart';
import 'package:placealouer/view/main_home/message/chat/chat_screen.dart';

class AnnoncesDetailScreen extends StatelessWidget {
  const AnnoncesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 300,
            width: Get.width,
            child: Image.asset(
              "assets/png/garage.png",
              fit: BoxFit.cover,
            ),
          ),
          height10,
          Align(
            alignment: Alignment.center,
            child: Text(
              "TITRE DE L’ANNONCE",
              style: AppTextStyle.regularBold25.copyWith(color: appBlackColor),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: containerColor),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/png/pdp 1.png"),
                        ),
                        width15,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Léa Dupond",
                              style: AppTextStyle.regularBold20
                                  .copyWith(color: appBlackColor),
                            ),
                            RatingBarIndicator(
                              itemSize: 20,
                              itemCount: 5,
                              rating: 2,
                              itemBuilder: (context, index) {
                                return const Icon(
                                  Icons.star_sharp,
                                  color: Colors.amber,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    CommonButton(
                      title: "10€/Jours",
                      style: AppTextStyle.regularBold15,
                      height: 25,
                      buttonColor: appBlackColor,
                      width: 80,
                      margin: EdgeInsets.zero,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/png/code_1.png",
                        height: 40,
                      ),
                      width10,
                      Expanded(
                        child: Text(
                          "L’accès à la location s’effectue avec un code.",
                          style: AppTextStyle.regularBold15
                              .copyWith(color: appBlackColor),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/alarm.svg",
                        height: 32,
                      ),
                      width10,
                      Expanded(
                        child: Text(
                          "Envoie automatique du code, le propriétaire valide immédiatement la réservation",
                          style: AppTextStyle.regularBold15
                              .copyWith(color: appBlackColor),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "Description de l’annonce faite par le propriétaire Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                  style:
                      AppTextStyle.regularBold15.copyWith(color: appBlackColor),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            blurRadius: 10,
            color: hintTextColor,
            offset: Offset(0, -5),
          ),
        ], color: appWhiteColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                child: CommonButton(
                  onTap: () {
                    Get.to(() => const ChatScreen());
                  },
                  height: 40,
                  title: "Contacter",
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  style: AppTextStyle.regularBold15,
                  borderColor: appBlackColor,
                  buttonColor: appBlackColor,
                ),
              ),
              width15,
              Expanded(
                child: CommonButton(
                  onTap: () {
                    Get.to(() => const BookScreen());
                  },
                  height: 40,
                  title: "Réserver",
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  style: AppTextStyle.regularBold15,
                  borderColor: appBlackColor,
                  buttonColor: appBlackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
