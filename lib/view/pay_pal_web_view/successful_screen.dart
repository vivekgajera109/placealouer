import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/main_home.dart';
// #FF6060

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({super.key});

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    // dialogBuilder(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.offAll(() => const MainHome());
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/successful.json'),
            Text(
              "Paiement réussi...",
              style: AppTextStyle.regularBold20.copyWith(color: appBlackColor),
            ),
            height20,
            CommonButton(
              onTap: () {
                Get.offAll(() => const MainHome());
              },
              title: "Aller à la maison",
              buttonColor: successfulColor,
              borderColor: successfulColor,
              titleColor: appWhiteColor,
              margin: const EdgeInsets.only(bottom: 20),
            ),
          ],
        ),
      ),
    );
  }
}

// class RatingDialog extends StatefulWidget {
//   final String? parkingId;
//   const RatingDialog({
//     super.key,
//     this.parkingId,
//   });

//   @override
//   State<RatingDialog> createState() => _RatingDialogState();
// }

// class _RatingDialogState extends State<RatingDialog> {
//   MainHomeController mainHomeController = Get.put(MainHomeController());
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       contentPadding: EdgeInsets.zero,
//       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
//       title: const Text('Ajouter un commentaire'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           height10,
          // RatingBar.builder(
          //   initialRating: mainHomeController.rating.value,
          //   itemBuilder: (context, _) => const Icon(
          //     Icons.star,
          //     color: Colors.amber,
          //   ),
          //   onRatingUpdate: (_) {
          //     mainHomeController.rating.value = _;
          //     print(_);
          //   },
          // ),
//           height10,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: textFormField(
//               controller: mainHomeController.reviewController,
//               contentPadding: const EdgeInsets.all(12),
//               filledColor: appWhiteColor,
//               hintText: "Votre avis",
//               textStyle: AppTextStyle.normalRegularBold15
//                   .copyWith(fontWeight: FontWeight.w500)
//                   .copyWith(color: appBlackColor),
//               hintStyle: AppTextStyle.normalRegularBold15
//                   .copyWith(fontWeight: FontWeight.w500)
//                   .copyWith(color: appBlackColor),
//               borderRaduis: 10,
//             ),
//           ),
//           height20,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: CommonButton(
//                     width: double.infinity,
//                     onTap: () {
//                       Get.back();
//                     },
//                     style: AppTextStyle.regularBold15.copyWith(
//                       color: appBlackColor,
//                     ),
//                     title: "Annuler",
//                     buttonColor: appWhiteColor,
//                     borderColor: appBlackColor,
//                     titleColor: appBlackColor,
//                     radius: 10,
//                     margin: const EdgeInsets.only(bottom: 20),
//                   ),
//                 ),
//                 width15,
//                 Expanded(
//                   child: CommonButton(
//                     onTap: () {
//                       // Get.offAll(() => const MainHome());
//                       mainHomeController.addRating(widget.parkingId!);
//                       // Get.back();
//                     },
//                     width: double.infinity,
//                     style: AppTextStyle.regularBold15.copyWith(
//                       color: appBlackColor,
//                     ),
//                     title: "Fait",
//                     radius: 10,
//                     buttonColor: appWhiteColor,
//                     borderColor: appBlackColor,
//                     titleColor: appBlackColor,
//                     margin: const EdgeInsets.only(bottom: 20),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
