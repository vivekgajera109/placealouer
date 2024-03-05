import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_screen.dart';
import 'package:placealouer/view/main_home/search_view/search_view.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: Get.height,
              color: containerColor,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: TextFormField(
                onTap: () {
                  Get.to(() => const SearchView());
                },
                readOnly: true,
                enabled: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: appBlackColor.withOpacity(0.6),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintStyle: TextStyle(
                    color: appBlackColor.withOpacity(0.6),
                  ),
                  hintText: "Entrer une adresse",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: textFormFieldColor,
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: CommonButton(
                  onTap: () {
                    Get.to(() => const AnnoncesScreen());
                  },
                  title: "ANNONCES",
                  buttonColor: buttonColor,
                  borderColor: buttonColor,
                  titleColor: appWhiteColor,
                  margin: const EdgeInsets.only(bottom: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
