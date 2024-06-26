import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/inscription/widget/social_login_widget.dart';

class CommonBackground extends StatelessWidget {
  final Widget? child;
  const CommonBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: Get.height,
        width: Get.width,
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
        child: child,
      ),
    );
  }
}

class CommonBackgroundAuth extends StatelessWidget {
  final String appBarTitle;
  final String? footerTitle;
  final Widget child;
  final Widget? childScial;
  final void Function()? footerOnTap;
  final Widget? childFoter;
  final bool? isScial;
  final bool? isLeading;
  final bool? isFooter;
  final Color? color;

  const CommonBackgroundAuth(
      {super.key,
      required this.appBarTitle,
      required this.child,
      this.isScial = false,
      this.isLeading = true,
      this.footerOnTap,
      this.isFooter = true,
      this.footerTitle,
      this.childFoter,
      this.color,
      this.childScial});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isLeading ?? true
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
                    : IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.transparent,
                        ),
                      ),
                Expanded(
                  child: Text(
                    appBarTitle,
                    style: AppTextStyle.regularBold30.copyWith(fontSize: 22),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: Get.width,
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                decoration: BoxDecoration(
                  color: color ?? appWhiteColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(child: child),
                    ),
                    isScial ?? false
                        ? socialLoginView(context: context)
                        : childScial ?? const SizedBox(),
                  ],
                ),
              ),
            ),
            height15,
            isFooter ?? true
                ? GestureDetector(
                    onTap: footerOnTap,
                    child: Text(
                      footerTitle ?? "",
                      style: AppTextStyle.normalRegularBold15.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: appWhiteColor,
                      ),
                    ),
                  )
                : childFoter ?? const SizedBox(),
            isFooter ?? true ? height15 : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
