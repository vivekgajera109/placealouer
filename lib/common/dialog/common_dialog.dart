import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          'Voulez vous annuler la réservation?',
          style: AppTextStyle.regularBold15.copyWith(color: appBlackColor),
        ),
        actionsPadding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
        actions: [
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  onTap: () {
                    Get.back();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: appBlackColor.withOpacity(0.9),
                          insetPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          title: Text(
                            'Votre réservation à été annulée',
                            style: AppTextStyle.regularBold20
                                .copyWith(fontSize: 18),
                          ),
                          content: Text(
                            "Vous recevrez prochainement un remboursement partiel ou intégral, en fonction de la date à laquelle votre annulation a été faite",
                            style: AppTextStyle.regularBold20
                                .copyWith(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  },
                  buttonColor: const Color(0xffFE8E8E),
                  borderColor: const Color(0xffFE8E8E),
                  title: "OUI",
                  style: AppTextStyle.regularBold15,
                  height: 30,
                ),
              ),
              customWidth(30),
              Expanded(
                  child: CommonButton(
                onTap: () {
                  Get.back();
                },
                buttonColor: const Color(0xff606060),
                borderColor: const Color(0xff606060),
                title: "NON",
                style: AppTextStyle.regularBold15,
                height: 30,
              )),
            ],
          )
        ],
      );
    },
  );
}

class BlurryDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback continueCallBack;
  final String? buttonText;

  const BlurryDialog(this.title, this.content, this.continueCallBack,
      {super.key, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        backgroundColor: containerColor,
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
              color: containerColor,
              width: 4.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style:
                    AppTextStyle.regularBold25.copyWith(color: appBlackColor),
                textAlign: TextAlign.center,
              ),
              height05,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  content,
                  style: AppTextStyle.normalRegularBold20
                      .copyWith(color: appBlackColor),
                  textAlign: TextAlign.center,
                ),
              ),
              height15,
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      margin: EdgeInsets.zero,
                      style: AppTextStyle.regularBold15,
                      height: 35,
                      width: 0,
                      title: "Non",
                      borderColor: appBlackColor,
                      buttonColor: appBlackColor,
                      titleColor: appWhiteColor,
                    ),
                  ),
                  width15,
                  Expanded(
                    child: CommonButton(
                      onTap: continueCallBack,
                      margin: EdgeInsets.zero,
                      style: AppTextStyle.regularBold15,
                      height: 35,
                      width: 0,
                      title: "Oui",
                      borderColor: appBlackColor,
                      buttonColor: appBlackColor,
                      titleColor: appWhiteColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
