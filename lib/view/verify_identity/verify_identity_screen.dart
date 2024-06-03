import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/auth_controller/verify_identity_controller.dart';
import 'package:placealouer/utils/process_indicator.dart';
import 'package:placealouer/common/background/common_background.dart';

class VerifyIdentity extends StatefulWidget {
  const VerifyIdentity({super.key});

  @override
  State<VerifyIdentity> createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {
  VerifyIdentityController verifyIdentityController =
      Get.put(VerifyIdentityController());
  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Vérifier votre identité",
                  style: AppTextStyle.regularBold30.copyWith(fontSize: 22),
                ),
                customHeight(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => verifyIdentityController
                              .selectedFileRecto.value.isEmpty
                          ? commonCard(
                              title: "Recto Carte d’identité",
                              onTap: () {
                                verifyIdentityController.pickFileRecto();
                              },
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.memory(
                                verifyIdentityController
                                    .selectedFileRecto.value,
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Obx(
                      () => verifyIdentityController
                              .selectedFileVerso.value.isEmpty
                          ? commonCard(
                              title: "Verso Carte d’identité",
                              onTap: () {
                                verifyIdentityController.pickFileVerso();
                              },
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.memory(
                                verifyIdentityController
                                    .selectedFileVerso.value,
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                    )
                  ],
                )
              ],
            ),
            CommonButton(
              title: "Continuer",
              onTap: () async {
                Circle().show(context);
                await verifyIdentityController.uplodImage(context);
                Circle().hide(context);
                // Get.to(
                //   () => const MainHome(),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector commonCard(
    {void Function()? onTap, String? title, Color? color}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 140,
      width: 140,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color ?? appWhiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: appBlackColor.withOpacity(0.2),
              offset: const Offset(0, 5),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          height05,
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(),
            ),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          Text(
            title ?? "",
            style: AppTextStyle.regularBold10
                .copyWith(color: appBlackColor, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          height05
        ],
      ),
    ),
  );
}
