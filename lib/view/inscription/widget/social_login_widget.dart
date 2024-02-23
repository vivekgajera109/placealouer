import 'package:flutter/material.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';

import '../../../constant/static_decoration.dart';

socialLoginView() {
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
      const Row(
        children: [
          width15,
          Expanded(
            child: CommonIconButton(iconUrl: "assets/svg/facebook_ic.svg"),
          ),
          width15,
          Expanded(
            child: CommonIconButton(iconUrl: "assets/svg/google_ic.svg"),
          ),
          width15,
          Expanded(
            child: CommonIconButton(iconUrl: "assets/svg/apple_ic.svg"),
          ),
          width15,
        ],
      )
    ],
  );
}
