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
                          backgroundColor: appBlackColor.withOpacity(0.8),
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
