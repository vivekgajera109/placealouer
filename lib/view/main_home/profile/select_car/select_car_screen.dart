import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/cached_network_image.dart';
import 'package:placealouer/controller/select_car_controller/select_car_controller.dart';
import 'package:placealouer/view/main_home/message/book/book_screen.dart';

class SelectCarScreen extends StatefulWidget {
  final String parkingId;
  const SelectCarScreen({super.key, required this.parkingId});

  @override
  State<SelectCarScreen> createState() => _SelectCarScreenState();
}

class _SelectCarScreenState extends State<SelectCarScreen> {
  SelectCarController selectCarController = Get.put(SelectCarController());
  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: appWhiteColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Selectionnez la voiture correspondant à la taille de votre garage",
                    style: AppTextStyle.regularBold25.copyWith(fontSize: 22),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: selectCarController.getParkingsCar(widget.parkingId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData == false ||
                      snapshot.data == null) {
                    return const Center(
                      child: Text("No data found"),
                    );
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: selectCarController.carList.length,
                      itemBuilder: (context, index) => Obx(() {
                        return GestureDetector(
                          onTap: () {
                            selectCarController.selectCar.value = index;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 45, vertical: 10),
                            decoration: BoxDecoration(
                              color:
                                  selectCarController.selectCar.value == index
                                      ? appWhiteColor
                                      : hintTextColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                NetworkImageWidget(
                                  imageUrl: selectCarController
                                              .selectCar.value !=
                                          index
                                      ? "${selectCarController.carList[index]["vehicleImg"]}"
                                      : "${selectCarController.carList[index]["selectVehicleImg"]}",

                                  // color: Colors.black.withOpacity(0.3),
                                  height: 60,
                                ),
                                Text(
                                  "${selectCarController.carList[index]["vehicleType"]}",
                                  style: AppTextStyle.regularBold20
                                      .copyWith(color: appBlackColor),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${selectCarController.carList[index]["slot"]}",
                                  style: AppTextStyle.regularBold20
                                      .copyWith(color: appBlackColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }
                },
              ),
            ),
            CommonButton(
              title: "Continuer",
              onTap: () {
                // Get.to(() => const SettingsScreen());
                Get.to(() => BookScreen(
                      parkingId: widget.parkingId,
                      parkingDetails: selectCarController
                          .carList[selectCarController.selectCar.value],
                    ));
              },
              margin: const EdgeInsets.only(bottom: 10),
            )
          ],
        ),
      ),
    );
  }
}
