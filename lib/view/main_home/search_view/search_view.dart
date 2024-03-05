import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/message/book/book_screen.dart';
import 'package:placealouer/view/main_home/profile/select_car/select_car_screen.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Column(
            children: [
              height05,
              TextFormField(
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
              height20,
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
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    customHeight(30),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const BookScreen());
                      },
                      child: Card(
                        color: containerColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/calendar_icon.svg",
                                height: 45,
                                width: 45,
                              ),
                              height20,
                              Text(
                                "Durée de la location",
                                style: AppTextStyle.normalSemiBold20
                                    .copyWith(color: appBlackColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    customHeight(70),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SelectCarScreen());
                      },
                      child: Card(
                        color: containerColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/car_icon.svg"),
                              height20,
                              Text(
                                "Taille du véhicule",
                                style: AppTextStyle.normalSemiBold20
                                    .copyWith(color: appBlackColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CommonButton(
                margin: EdgeInsets.all(10),
                title: "VALIDER",
                onTap: () {
                  Get.back();
                },
                buttonColor: buttonColor,
                borderColor: buttonColor,
                titleColor: appWhiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
