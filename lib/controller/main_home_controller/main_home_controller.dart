import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
