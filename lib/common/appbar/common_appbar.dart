import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';

AppBar commonAppBar(
    {Widget? title, List<Widget>? actions, bool leading = true}) {
  return AppBar(
    centerTitle: true,
    leading: leading
        ? IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: appWhiteColor,
            ),
          )
        : SizedBox(),
    title: title,
    actions: actions,
    flexibleSpace: Container(
      height: 160,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color(0xff5ADBE4),
            Color(0xff0552B0),
          ],
        ),
      ),
    ),
  );
}
