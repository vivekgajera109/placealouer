import 'dart:io';
import 'package:flutter/material.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/social_login.dart';

import '../../../constant/static_decoration.dart';

socialLoginView({required BuildContext context}) {
  return Column(
    children: [
      Row(
        children: [
          width15,
          const Expanded(
              child: Divider(
            color: appBlackColor,
          )),
          width10,
          Text(
            "S’inscrire avec :",
            style: AppTextStyle.normalSemiBold15.copyWith(
              color: appBlackColor,
            ),
          ),
          width10,
          const Expanded(
              child: Divider(
            color: appBlackColor,
          )),
          width15,
        ],
      ),
      height20,
      Row(
        children: [
          width15,
          Expanded(
            child: CommonIconButton(
              iconUrl: "assets/svg/facebook_ic.svg",
              onTap: () {
                facebbookSignin();
              },
            ),
          ),
          width15,
          Expanded(
            child: CommonIconButton(
              iconUrl: "assets/svg/google_ic.svg",
              onTap: () {
                signup(context);
              },
            ),
          ),
          width15,
          Platform.isIOS
              ? Expanded(
                  child: CommonIconButton(
                    iconUrl: "assets/svg/apple_ic.svg",
                    onTap: () async {
                      appleLogin(context);
                      // print(credential);
                    },
                  ),
                )
              : const SizedBox(),
          Platform.isIOS ? width15 : const SizedBox(),
        ],
      )
    ],
  );
}
