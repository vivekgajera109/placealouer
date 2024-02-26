import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/inscription/cgu/cgu_view.dart';
import 'package:placealouer/view/inscription/privacy_policy/privacy_policy.dart';
import 'package:placealouer/view/main_home/profile/mes_annonces/mes_annonces_view.dart';
import 'package:placealouer/view/main_home/profile/porte-monnaie/porte_monnaie_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      isLeading: false,
      isFooter: false,
      color: containerColor,
      appBarTitle: "COMPTE",
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 45),
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
          customHeight(30),
          coutomCard(
            iconUrl: "assets/svg/map_pin.svg",
            title: "Mes annonces",
            onTap: () {
              Get.to(() => const MesAnnoncesScreen());
            },
          ),
          coutomCard(
            iconUrl: "assets/svg/wallet-01.svg",
            title: "Porte-monnaie",
            onTap: () {
              Get.to(() => const PorteMonnaieSacreen());
            },
          ),
          coutomCard(
              iconUrl: "assets/svg/help-circle-contained.svg", title: "Aide"),
          GestureDetector(
            onTap: () {
              Get.to(() => const PrivacyPolicy());
            },
            child: Text(
              "Politique de confidentialité",
              style: AppTextStyle.regularBold15.copyWith(
                fontWeight: FontWeight.w400,
                color: hintTextColor,
                fontSize: 12,
                decorationColor: hintTextColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          height05,
          GestureDetector(
            onTap: () {
              Get.to(() => const CguScreen());
            },
            child: Text(
              "Conditions générales d’utilisation",
              style: AppTextStyle.regularBold15.copyWith(
                fontWeight: FontWeight.w400,
                color: hintTextColor,
                fontSize: 12,
                decorationColor: hintTextColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector coutomCard(
      {required String iconUrl,
      required String title,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: Get.width,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  iconUrl,
                  height: 50,
                ),
                // height10,
                Text(
                  title,
                  style:
                      AppTextStyle.regularBold20.copyWith(color: appBlackColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
