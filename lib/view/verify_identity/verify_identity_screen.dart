import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/main_home.dart';
import 'package:placealouer/common/background/common_background.dart';

class VerifyIdentity extends StatefulWidget {
  const VerifyIdentity({super.key});

  @override
  State<VerifyIdentity> createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {
  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Vérifier votre identité",
                  style: AppTextStyle.regularBold30.copyWith(fontSize: 22),
                ),
                customHeight(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    commonCard(
                      title: "Recto Carte d’identité",
                      onTap: () {},
                    ),
                    commonCard(
                      title: "Verso Carte d’identité",
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
            CommonButton(
              title: "Continuer",
              onTap: () {
                Get.to(
                  () => const MainHome(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector commonCard(
    {void Function()? onTap, String? title, Color? color}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 140,
      width: 140,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color ?? appWhiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: appBlackColor.withOpacity(0.2),
              offset: const Offset(0, 5),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          height05,
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(),
            ),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          Text(
            title ?? "",
            style: AppTextStyle.regularBold10
                .copyWith(color: appBlackColor, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          height05
        ],
      ),
    ),
  );
}
