import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/Information_screen.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_detail_screen.dart';

import '../../../../constant/app_colors.dart';

class AnnoncesScreen extends StatelessWidget {
  const AnnoncesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(
          title: Text(
            "Annonces".toUpperCase(),
            style: AppTextStyle.regularBold20,
          ),
        ),
        floatingActionButton: CommonButton(
          onTap: () {
            Get.back();
          },
          title: "CARTE",
          buttonColor: buttonColor,
          borderColor: buttonColor,
          titleColor: appWhiteColor,
          margin: const EdgeInsets.only(bottom: 20),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: appBlackColor.withOpacity(0.6),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintStyle: TextStyle(
                    color: appBlackColor.withOpacity(0.6),
                  ),
                  hintText: "Entrer une adresse",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: textFormFieldColor,
                ),
              ),
            ),
            height10,
            Row(
              children: [
                const Expanded(
                    child: Divider(
                  color: appBlackColor,
                )),
                width10,
                const Icon(Icons.info_outline),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const InformationScreen());
                  },
                  child: Text(
                    "Information sur les icônes",
                    style: AppTextStyle.normalSemiBold15.copyWith(
                      color: appBlackColor,
                    ),
                  ),
                ),
                width10,
                const Expanded(
                  child: Divider(
                    color: appBlackColor,
                  ),
                ),
              ],
            ),
            height10,
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => const AnnoncesDetailScreen());
                    },
                    child: Card(
                      elevation: 3,
                      margin: const EdgeInsets.all(15),
                      color: containerColor,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                              "assets/png/garage.png")),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          width10,
                                          index * 2 == 0
                                              ? SvgPicture.asset(
                                                  "assets/svg/alarm.svg",
                                                  height: 22,
                                                )
                                              : Image.asset(
                                                  "assets/png/code_1.png",
                                                  height: 32,
                                                ),
                                          width10,
                                          index * 2 == 0
                                              ? SvgPicture.asset(
                                                  "assets/svg/code_1.svg",
                                                  height: 22,
                                                )
                                              : SvgPicture.asset(
                                                  "assets/svg/plug.svg",
                                                  height: 22,
                                                ),
                                        ],
                                      ),
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage("assets/png/pdp 1.png"),
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RatingBarIndicator(
                                      itemSize: 20,
                                      itemCount: 5,
                                      rating: 4,
                                      itemBuilder: (context, index) {
                                        return const Icon(
                                          Icons.star_sharp,
                                          color: Colors.amber,
                                        );
                                      },
                                    ),
                                    width15,
                                    Text(
                                      "à 1.4 km",
                                      style:
                                          AppTextStyle.regularBold20.copyWith(
                                        color: const Color(0xff247892),
                                      ),
                                    ),
                                    width10,
                                    CommonButton(
                                      title: "10€/Jours",
                                      style: AppTextStyle.regularBold15,
                                      height: 25,
                                      buttonColor: appBlackColor,
                                      width: 80,
                                      margin: EdgeInsets.zero,
                                    )
                                  ])
                            ],
                          )
                          //  Row(
                          //   children: [
                          //     Expanded(
                          //       child: Column(
                          //         children: [
                          // ClipRRect(
                          //     borderRadius: BorderRadius.circular(10),
                          //     child: Image.asset("assets/png/garage.png")),
                          //           height10,
                          // RatingBarIndicator(
                          //   itemSize: 20,
                          //   itemCount: 5,
                          //   rating: 4,
                          //   itemBuilder: (context, index) {
                          //     return const Icon(
                          //       Icons.star_sharp,
                          //       color: Colors.amber,
                          //     );
                          //   },
                          // ),
                          //         ],
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Text(
                          //             "à 1.4 km",
                          //             style: AppTextStyle.regularBold20.copyWith(
                          //               color: Colors.transparent,
                          //             ),
                          //           ),
                          // Row(
                          //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     width10,
                          //     index * 2 == 0
                          //         ? SvgPicture.asset(
                          //             "assets/svg/alarm.svg",
                          //             height: 22,
                          //           )
                          //         : Image.asset(
                          //             "assets/png/code_1.png",
                          //             height: 32,
                          //           ),
                          //     width10,
                          //     index * 2 == 0
                          //         ? SvgPicture.asset(
                          //             "assets/svg/code_1.svg",
                          //             height: 22,
                          //           )
                          //         : SvgPicture.asset(
                          //             "assets/svg/plug.svg",
                          //             height: 22,
                          //           ),
                          //   ],
                          // ),
                          //           customHeight(25),
                          // Text(
                          //   "à 1.4 km",
                          //   style: AppTextStyle.regularBold20.copyWith(
                          //     color: const Color(0xff247892),
                          //   ),
                          // )
                          //         ],
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           const CircleAvatar(
                          //             backgroundColor: Colors.transparent,
                          //             radius: 25,
                          //             backgroundImage: AssetImage("assets/png/pdp 1.png"),
                          //           ),
                          // CommonButton(
                          //   title: "10€/Jours",
                          //   style: AppTextStyle.regularBold15,
                          //   height: 25,
                          //   buttonColor: appBlackColor,
                          //   width: 80,
                          // )
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
