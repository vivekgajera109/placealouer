// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:placealouer/common/commo_clendar/commo_clendar.dart';
import 'package:placealouer/utils/network/repo.dart';
import 'package:placealouer/utils/process_indicator.dart';
import 'package:placealouer/view/pay_pal_web_view/pay_pal_web_view.dart';
import 'package:placealouer/view/pay_pal_web_view/successful_screen.dart';
import 'package:placealouer/view/pay_pal_web_view/un_successful_screen.dart';

class SelectCarController extends GetxController {
  RxInt selectCar = 0.obs;
  RxInt totalHoures = 0.obs;
  RxInt dateRange = 0.obs;
  RxString? selectCarType;
  RxDouble rating = 0.0.obs;
  RxList carList = [].obs;
  RxList<DateTime?> rangeDatePickerValueWithDefaultValue = <DateTime?>[].obs;

  TextEditingController reviewController = TextEditingController();
  Rx<TextEditingController> firstDateController = TextEditingController().obs;
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  Rx<TextEditingController> lastDateController = TextEditingController().obs;
  // TextEditingController firstHourController = TextEditingController();
  // TextEditingController lastHourController = TextEditingController();
  RxInt firstHour = 0.obs;
  RxInt lastHour = 0.obs;
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now();
  Future getParkingsCar(String parkingId) async {
    var res = await ApiRepo.getParkingsCar(parkingId);
    carList.value = res.data["data"]["parking"]["ParkingDetails"] ?? [];
    selectCarType?.value =
        res.data["data"]["parking"]["ParkingDetails"][0]["vehicleType"] ?? "";
    return res.data;
  }

  void setDateRange() {
    dateRange.value = generateDateRange(
            DateTime.parse(firstDateController.value.text),
            DateTime.parse(lastDateController.value.text))
        .toList()
        .length;
    dateRange.refresh();
  }

  Future<bool> bookParkings(
      String parkingId, String vehicleType, BuildContext context) async {
    var data = {
      "startTime": DateTime(
              firstDate.year, firstDate.month, firstDate.day, firstHour.value)
          .toString(),
      "endTime":
          DateTime(lastDate.year, lastDate.month, lastDate.day, lastHour.value)
              .toString(),
      "parkingId": parkingId,
      "vehicleType": vehicleType,
      "vehicleName": vehicleNameController.text,
      "vehicleNumber": vehicleNumberController.text,
    };
    log("-----------===================-> $data");
    var res = await ApiRepo.bookParkings(data, context);
    log("-----------===================-> ${res.data}");
    if (res.code == 200) {
      var res = await payment(parkingId);
      log("-----------===================-> $res");

      // globalScaffoldKey.currentState?.showSnackBar(successfulSnackBar(res.data));
      clearData();
      return true;
    } else {
      Circle().hide(context);
    }
    return res.data;
    // carList.value = res.data["data"]["parking"]["ParkingDetails"] ?? [];
    // selectCarType?.value =
    //     res.data["data"]["parking"]["ParkingDetails"][0]["vehicleType"] ?? "";
    // return res.data;
  }

  Future payment(String parkingId) async {
    var data = {"charge": 1, "ParkingId": parkingId};
    var res = await ApiRepo.payment(data);
    log("-----------===================->123 ${res.data["data"]["url"]}");
    if (res.code == 200) {
      Get.to<Uri>(
        () => PayPalWebView(
          url: res.data["data"]["url"],
        ),
      )?.then(
        (value) {
          if (value.toString().contains('success')) {
// Get.Get.of
            Get.off(() => const SuccessfulScreen());
          }

          if (value.toString().contains('cancel')) {
// Get.Get.of
            Get.off(() => const UnSuccessfulScreen());
          }
        },
      );

      return res.data;
    }
    return res.data;
    // carList.value = res.data["data"]["parking"]["ParkingDetails"] ?? [];
    // selectCarType?.value =
    //     res.data["data"]["parking"]["ParkingDetails"][0]["vehicleType"] ?? "";
    // return res.data;
  }

  Future addReview() async {
    var data = {
      "parkingId": "6633b50b02d498789f7cfc29",
      "rating": 4,
      "review": "test012"
    };
    var res = await ApiRepo.payment(data);
    log("-----------===================->123 ${res.data["data"]["url"]}");
    if (res.code == 200) {
      Get.back();

      return res.data;
    }
    return res.data;
    // carList.value = res.data["data"]["parking"]["ParkingDetails"] ?? [];
    // selectCarType?.value =
    //     res.data["data"]["parking"]["ParkingDetails"][0]["vehicleType"] ?? "";
    // return res.data;
  }

  void clearData() {
    firstDateController.value.clear();
    vehicleNameController.clear();
    vehicleNumberController.clear();
    lastDateController.value.clear();
    // firstHourController.clear();
    // lastHourController.clear();
  }
}

class CarModel {
  String? image;
  String? selectedImage;
  String? title;
  CarModel({this.image, this.title, this.selectedImage});
}
