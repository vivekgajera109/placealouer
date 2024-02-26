import 'package:flutter/material.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';

class DurationScreen extends StatelessWidget {
  const DurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      appBarTitle: "Durée",
      childFoter: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "L’heure de fin est inclue",
          style: AppTextStyle.normalSemiBold10
              .copyWith(color: appBlackColor, fontSize: 12),
        ),
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}
