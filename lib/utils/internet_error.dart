import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';

class InternetError {
  static final _instance = InternetError.internal();
  factory InternetError() => _instance;
  InternetError.internal();

  static OverlayEntry? entry;

  void show(context, page) => addOverlayEntry(context);
  void hide() => removeOverlay();

  bool get isShow => entry != null;

  addOverlayEntry(context) {
    if (entry != null) return;
    entry = OverlayEntry(
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            return Material(
              color: appBlackColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image.asset(AppAsset.nointernet),
                      const Icon(
                        Icons.signal_wifi_bad_outlined,
                        size: 25.0,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "No internet connection",
                        style: AppTextStyle.normalSemiBold20,
                      ),
                      height10,
                      Text(
                        "Please check your keyword or try again your browsing keyword",
                        style: AppTextStyle.normalRegularBold15
                            .copyWith(color: appWhiteColor.withOpacity(0.60)),
                        textAlign: TextAlign.center,
                      ),
                      customHeight(30),
                      // PrimaryTextButton(
                      //     title: "Try again",
                      //     onPressed: () {
                      //       removeOverlay();
                      //     }),
                      height15,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: circular30BorderRadius,
                            border: Border.all(color: appBlackColor),
                          ),
                          child: Center(
                            child: Text(
                              "Check your network",
                              style: AppTextStyle.normalSemiBold15
                                  .copyWith(color: appBlackColor),
                            ),
                          ),
                        ),
                      ),

                      //   Center(
                      // child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Image.asset(
                      //       'assets/gif/no-internet.gif',
                      //       height: 250,
                      //     ),
                      //     const SizedBox(
                      //       height: 50,
                      //     ),
                      //     const Text(
                      //       "Please check your internet connection!",
                      //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      //     ),
                      //     const SizedBox(
                      //       height: 20,
                      //     ),
                      //     SizedBox(
                      //       // decoration: BoxDecoration(
                      //       //   borderRadius: BorderRadius.circular(50),
                      //       // ),
                      //       height: 50,
                      //       width: 200,
                      //       child: TextButton(
                      //         style: TextButton.styleFrom(
                      //           backgroundColor: Colors.black.withOpacity(0.1),
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(50.0),
                      //           ),
                      //         ),
                      //         onPressed: () {
                      //           removeOverlay();
                      //         },
                      //         child: const Text(
                      //           "Okay",
                      //           style:
                      //               TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    addOverlay(entry!, context);
  }

  addOverlay(OverlayEntry entry, context) async {
    Overlay.of(context).insert(entry);
  }

  removeOverlay() {
    entry?.remove();
    entry = null;
  }
}
