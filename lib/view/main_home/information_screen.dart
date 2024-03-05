import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: Text(
          "Information".toUpperCase(),
          style: AppTextStyle.regularBold20,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
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
                        "assets/svg/Key_alt.svg",
                        height: 32,
                      ),
                      width10,
                      Expanded(
                        child: Text(
                          "L’accès à la location s’effectue avec des clés ou un badge.",
                          style: AppTextStyle.regularBold15
                              .copyWith(color: appBlackColor),
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
                        "assets/svg/users-profiles-01.svg",
                        height: 32,
                      ),
                      width10,
                      Expanded(
                        child: Text(
                          "Le propriétaire remet la clef en main propre",
                          style: AppTextStyle.regularBold15
                              .copyWith(color: appBlackColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
