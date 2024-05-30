import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/text_widgets/validator.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/profile_controller/profile_controller.dart';
import 'package:placealouer/model/get_prosile_model.dart';
import 'package:placealouer/utils/process_indicator.dart';

class UpdateProfile extends StatefulWidget {
  final ProfileUser userData;
  const UpdateProfile({super.key, required this.userData});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    profileController.setData(userData: widget.userData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      // isLeading: false,
      isFooter: false,
      color: containerColor,
      appBarTitle: "Editer le profil",
      child: Column(
        children: [
          // Obx(() {
          GestureDetector(
            onTap: () {
              profileController.pickFile().then((value) => setState(() {}));
            },
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              // backgroundImage: widget.userData.profileImg != null
              //     ? NetworkImage(widget.userData.profileImg!) as ImageProvider
              //     : MemoryImage(
              //         profileController.uploadImageUrl ?? Uint8List(0),
              //         // fit: BoxFit.cover,
              //       ),
              backgroundImage: profileController.uploadImageUrl.value.isNotEmpty
                  ? MemoryImage(
                      profileController.uploadImageUrl.value,
                      // fit: BoxFit.cover,
                    ) as ImageProvider
                  : widget.userData.profileImg != null
                      ? NetworkImage(widget.userData.profileImg!)
                          as ImageProvider
                      : const AssetImage("assets/png/pdp 1.png"),
            ),
          ),
          // }),
          height15,
          textFormField(
            controller: profileController.firstNameController,
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            hintText: "Prénom",
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
            validator: (value) {
              return Validators.validateText(text: "Prénom", value: value);
            },
          ),
          height15,
          textFormField(
            controller: profileController.lastNameController,
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            hintText: "Nom",
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
            validator: (value) {
              return Validators.validateText(text: "Nom", value: value);
            },
          ),
          height15,
          textFormField(
            controller: profileController.emailController,
            readonly: true,
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            hintText: "Adresse email",
            textAlign: TextAlign.center,
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
            validator: (value) {
              return Validators.validateEmail(value!);
            },
          ),
          height15,
          textFormField(
            controller: profileController.numberController,
            contentPadding: const EdgeInsets.all(12),
            filledColor: textFormFieldColor,
            textStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            hintText: "Numéro de téléphone",
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            validator: (value) {
              return Validators.validateMobile(value!);
            },
            hintStyle: AppTextStyle.normalRegularBold15
                .copyWith(fontWeight: FontWeight.w500)
                .copyWith(color: appBlackColor),
            borderRaduis: 50,
          ),
          height20,
          CommonButton(
            onTap: () async {
              Circle().show(context);
              profileController.uploadImageUrl.value.isNotEmpty
                  ? await profileController
                      .uplodImage(context)
                      .then((value) => {
                            if (value)
                              {
                                Get.back(),
                                // Get.offAll(() => const HomeScreen()),
                                Circle().hide(context),
                              }
                            else
                              Circle().hide(context),
                          })
                  : await profileController
                      .updateProfile(context, widget.userData.profileImg ?? "")
                      .then((value) => {
                            if (value)
                              {
                                Get.back(),
                                // Get.offAll(() => const HomeScreen()),
                                Circle().hide(context),
                              }
                            else
                              Circle().hide(context),
                          });

              Circle().hide(context);
            },
            title: "Mise à jour",
            buttonColor: buttonColor,
            borderColor: buttonColor,
            titleColor: appWhiteColor,
            margin: const EdgeInsets.only(bottom: 20),
          ),
        ],
      ),
    );
  }
}
