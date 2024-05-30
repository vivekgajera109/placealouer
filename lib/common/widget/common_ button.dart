// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? titleColor;
  final String title;
  final TextStyle? style;
  final double? height;
  final double? width;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  const CommonButton(
      {super.key,
      this.onTap,
      this.buttonColor,
      required this.title,
      this.borderColor,
      this.radius,
      this.height,
      this.width,
      this.margin,
      this.style,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 42,
        width: width ?? 232,
        margin: margin ?? const EdgeInsetsDirectional.only(bottom: 40),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? appBlackColor),
          color: buttonColor ?? appWhiteColor,
          borderRadius: BorderRadius.circular(radius ?? 50),
        ),
        child: Center(
          child: Text(
            title,
            style: style ??
                AppTextStyle.regularBold25
                    .copyWith(color: titleColor ?? appBlackColor),
          ),
        ),
      ),
    );
  }
}

class CommonIconButton extends StatelessWidget {
  final String iconUrl;
  final void Function()? onTap;
  const CommonIconButton({super.key, required this.iconUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SvgPicture.asset(iconUrl),
      ),
    );
  }
}
