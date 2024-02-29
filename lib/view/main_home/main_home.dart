import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/controller/main_home_controller/main_home_controller.dart';
import 'package:placealouer/view/main_home/message/message_screen.dart';
import 'package:placealouer/view/main_home/profile/profile_view.dart';
import 'package:placealouer/view/main_home/profile/publier/publier_screen.dart';
import 'package:placealouer/view/main_home/reservations/reservations_screen.dart';
import 'package:placealouer/view/main_home/search_view/map/map_screen.dart';

import 'search_view/search_view.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  MainHomeController mainHomeController = Get.put(MainHomeController());
  void _onItemTapped(int index) {
    setState(() {
      mainHomeController.selectedIndex.value = index;
    });
  }

  List<Widget> widgetOptions = <Widget>[
    // const SearchView(),
    const GoogleMapScreen(),
    const PublierScreen(),
    const ReservationsScreen(),
    const MessageScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhiteColor,
      body: SafeArea(
        child: widgetOptions.elementAt(mainHomeController.selectedIndex.value),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xff5ADBE4),
              Color(0xff0552B0),
            ],
          ),
        ),
        child: BottomNavigationBar(
          unselectedFontSize: 12,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            mainHomeController.bottomNavigationBarItem(
              iconUrl: "assets/png/search-02.png",
              label: 'Rechercher',
            ),
            mainHomeController.bottomNavigationBarItem(
              iconUrl: "assets/png/add-square-03.png",
              label: 'Publier',
            ),
            mainHomeController.bottomNavigationBarItem(
              iconUrl: "assets/png/app_icon2.png",
              label: 'Rechercher',
            ),
            mainHomeController.bottomNavigationBarItem(
              iconUrl: "assets/png/message-text-02.png",
              label: 'Messages',
            ),
            mainHomeController.bottomNavigationBarItem(
              iconUrl: "assets/png/user-profile-circle.png",
              label: 'Compte',
            ),
          ],
          currentIndex: mainHomeController.selectedIndex.value,
          unselectedItemColor: appWhiteColor,
          selectedItemColor: appWhiteColor,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
