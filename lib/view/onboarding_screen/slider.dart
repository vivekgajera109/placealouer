// ignore: must_be_immutable
// slider declared
import 'package:flutter/material.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';

class CustomSlider extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const CustomSlider(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(image: AssetImage(image)),
        height20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            title,
            style: AppTextStyle.regularBold25.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        height20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              subTitle,
              style: AppTextStyle.normalSemiBold15.copyWith(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
