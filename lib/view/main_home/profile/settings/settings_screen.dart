// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:placealouer/common/background/common_background.dart';
// import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
// import 'package:placealouer/common/widget/common_%20button.dart';
// import 'package:placealouer/constant/app_colors.dart';
// import 'package:placealouer/constant/app_style.dart';
// import 'package:placealouer/constant/static_decoration.dart';
// import 'package:placealouer/controller/settings_controller/settings_controller.dart';
// import 'package:placealouer/view/main_home/profile/duration/duration_screen.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   SettingsController settingsController = Get.put(SettingsController());
//   @override
//   Widget build(BuildContext context) {
//     return CommonBackgroundAuth(
//       color: containerColor,
//       isFooter: false,
//       appBarTitle: "Autres réglages",
//       childScial: CommonButton(
//         title: "Continuer",
//         margin: const EdgeInsets.only(bottom: 10),
//         onTap: () {
//           Get.to(() => const DurationScreen());
//         },
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: textFormField(
//                   contentPadding: const EdgeInsets.all(12),
//                   filledColor: appWhiteColor,
//                   hintText: "Prix par jour",
//                   textStyle:
//                       AppTextStyle.regularBold15.copyWith(color: appBlackColor),
//                   hintStyle:
//                       AppTextStyle.regularBold15.copyWith(color: hintTextColor),
//                   borderRaduis: 10,
//                 ),
//               ),
//               width15,
//               width15,
//               Expanded(
//                 child: textFormField(
//                   contentPadding: const EdgeInsets.all(12),
//                   filledColor: appWhiteColor,
//                   hintText: "Prix par heure",
//                   textStyle:
//                       AppTextStyle.regularBold15.copyWith(color: appBlackColor),
//                   hintStyle:
//                       AppTextStyle.regularBold15.copyWith(color: hintTextColor),
//                   borderRaduis: 10,
//                 ),
//               ),
//             ],
//           ),
//           customHeight(30),
//           Obx(() {
//             return Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Text(
//                     "Accepter automatiquement les réservations journalières",
//                     style: AppTextStyle.regularBold20
//                         .copyWith(color: appBlackColor, fontSize: 18),
//                   ),
//                 ),
//                 Switch(
//                   activeColor: greenSwitchColor,
//                   thumbColor: MaterialStateProperty.all(appWhiteColor),
//                   value: settingsController.isAcceptDaily.value,
//                   onChanged: (value) {
//                     settingsController.isAcceptDaily.value = value;
//                   },
//                 ),
//               ],
//             );
//           }),
//           customHeight(30),
//           Obx(
//             () {
//               return Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       "Accepter automatiquement les réservations horaires",
//                       style: AppTextStyle.regularBold20
//                           .copyWith(color: appBlackColor, fontSize: 18),
//                     ),
//                   ),
//                   Switch(
//                     activeColor: greenSwitchColor,
//                     thumbColor: MaterialStateProperty.all(appWhiteColor),
//                     value: settingsController.isAcceptHourly.value,
//                     onChanged: (value) {
//                       settingsController.isAcceptHourly.value = value;
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),
//           customHeight(40),
//           Text(
//             "Accès avec :",
//             style: AppTextStyle.regularBold20.copyWith(color: appBlackColor),
//           ),
//           height20,
//           Obx(() {
//             return Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           settingsController.isCode.value =
//                               !settingsController.isCode.value;
//                           settingsController.isClefs.value = false;
//                         },
//                         child: Card(
//                             color: settingsController.isCode.value
//                                 ? blueColor
//                                 : appWhiteColor,
//                             elevation: 2,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: Column(
//                                 children: [
//                                   SvgPicture.asset("assets/svg/code_1.svg",
//                                       height: 45,
//                                       color: settingsController.isCode.value
//                                           ? appWhiteColor
//                                           : appBlackColor),
//                                   Text(
//                                     "Code",
//                                     style: AppTextStyle.regularBold15.copyWith(
//                                         color: settingsController.isCode.value
//                                             ? appWhiteColor
//                                             : appBlackColor),
//                                   )
//                                 ],
//                               ),
//                             )),
//                       ),
//                     ),
//                     width15,
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           settingsController.isClefs.value =
//                               !settingsController.isClefs.value;
//                           settingsController.isCode.value = false;
//                         },
//                         child: Card(
//                             color: settingsController.isClefs.value
//                                 ? blueColor
//                                 : appWhiteColor,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: Column(
//                                 children: [
//                                   SvgPicture.asset(
//                                     "assets/svg/Key_alt.svg",
//                                     color: settingsController.isClefs.value
//                                         ? appWhiteColor
//                                         : appBlackColor,
//                                     height: 45,
//                                   ),
//                                   Text(
//                                     "Clefs / Badge",
//                                     style: AppTextStyle.regularBold15.copyWith(
//                                         color: settingsController.isClefs.value
//                                             ? appWhiteColor
//                                             : appBlackColor),
//                                   )
//                                 ],
//                               ),
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//                 height20,
//                 if (settingsController.isClefs.value ||
//                     settingsController.isCode.value)
//                   textFormField(
//                     contentPadding: const EdgeInsets.all(12),
//                     filledColor: textFormFieldColor,
//                     hintText: settingsController.isCode.value
//                         ? "Indiquez un code"
//                         : "Indiquez un code si nécessaire",
//                     textStyle: AppTextStyle.regularBold15
//                         .copyWith(color: appBlackColor),
//                     hintStyle: AppTextStyle.regularBold15
//                         .copyWith(color: appBlackColor),
//                     borderRaduis: 10,
//                   ),
//               ],
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
