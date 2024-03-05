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
              size: 25,
              color: appWhiteColor,
            ),
          )
        : const SizedBox(),
    title: title,
    actions: actions,
    flexibleSpace: Container(
      height: 100,
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

PreferredSize commonPreferredSize(
    {Widget? title, List<Widget>? actions, bool leading = true}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: Container(
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
      child: commonAppBar(title: title, actions: actions, leading: leading),
    ),
  );
}
