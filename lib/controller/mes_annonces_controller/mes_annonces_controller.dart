import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/model/get_parking_model.dart';
import 'package:placealouer/utils/common_methods.dart';
import 'package:placealouer/utils/repository/network_repository.dart';

class MesAnnoncesController extends GetxController {
  RxBool isActive = false.obs;
  RxList<Parking> parking = <Parking>[].obs;
  // Future getParkings(BuildContext context) async {
  // var res =
  //       await networkRepository.getParkings(context, {"page": 1, "limit": 10});
  //   log("--->> $res");
  //   if (res["statusCode"] == 200) {
  //     CommonMethod().getXSnackBar(
  //         "Success", "OTP Successfully Verified", greenContainerColor);
  //     // clear();
  //   } else {
  //     CommonMethod().getXSnackBar(
  //         "Error",
  //         "You have entered an invalid email or phone number!",
  //         redContainerColor);
  //   }
  // }
}
