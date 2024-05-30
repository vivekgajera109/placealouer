import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:placealouer/model/get_booked_parking_model.dart';
import 'package:placealouer/utils/network/repo.dart';

class MainHomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  BottomNavigationBarItem bottomNavigationBarItem({
    required String iconUrl,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconUrl,
        height: 35,
        width: 35,
      ),
      label: label,
    );
  }

  RxList<Parking>? bookedParking = <Parking>[].obs;
  RxInt page = 1.obs;

  Future<GetBookedParkingsData?> getBookedParkings() async {
    var res = await ApiRepo.getBookedParkings<GetBookedParkingsModel>(
      {"page": 1, "limit": 100},
    );

    if (res.code == 200) {
      bookedParking?.value = res.data!.data!.parking!;
      bookedParking?.refresh();
    }
    return res.data?.data;
    // if (res.code == 200) {
    //   return true;
    // } else {
    //   return false;
  }
}
