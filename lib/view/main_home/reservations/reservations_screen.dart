import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/cached_network_image.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/main_home_controller/main_home_controller.dart';
import 'package:placealouer/model/get_booked_parking_model.dart';
import 'package:placealouer/view/main_home/reservations/reservations_details_screen.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_screen.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  MainHomeController mainHomeController = Get.put(MainHomeController());
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        mainHomeController.getBookedParkings();
        mainHomeController.page.value++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: Text(
            "Mes réservations",
            style: AppTextStyle.regularBold20,
          ),
          leading: false),
      body: FutureBuilder(
        future: mainHomeController.getBookedParkings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildShimmerLoading();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData == false || snapshot.data == null) {
            return const Center(
              child: Text("No data found"),
            );
          } else {
            return snapshot.data!.parking!.isEmpty
                ? const Center(
                    child: Text(
                      "Le parking réservé \nn'est pas disponible",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Obx(
                    () {
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: mainHomeController.bookedParking?.length,
                        itemBuilder: (context, index) {
                          Parking data =
                              mainHomeController.bookedParking![index];
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.all(10),
                            color: containerColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 96,
                                              width: 128,
                                              decoration: BoxDecoration(
                                                color: appWhiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child:
                                                  // Image.asset("assets/png/garage.png
                                                  ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: NetworkImageWidget(
                                                  imageUrl: data.parkingDetails!
                                                      .parkingImg![0],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            height05,
                                            RatingBarIndicator(
                                              itemSize: 22,
                                              rating: data.rating?.toDouble() ??
                                                  0.0,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star_rounded,
                                                color: Colors.amber,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      width10,
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Code : XXXXX",
                                              style: AppTextStyle.regularBold15
                                                  .copyWith(
                                                      color: appBlackColor),
                                            ),
                                            height10,
                                            Text(
                                              "Durée : ${DateFormat("EEE, MMM d").format(data.startTime!)} - ${DateFormat("EEE, MMM d").format(data.endTime!)}",
                                              style: AppTextStyle.regularBold15
                                                  .copyWith(
                                                      color: appBlackColor),
                                            ), // height20,
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.spaceAround,
                                            //   children: [
                                            //     Image.asset(
                                            //       "assets/png/code_1.png",
                                            //       height: 32,
                                            //     ),
                                            //     SvgPicture.asset(
                                            //       "assets/svg/alarm.svg",
                                            //       height: 22,
                                            //     ),
                                            //     SvgPicture.asset(
                                            //       "assets/svg/plug.svg",
                                            //       height: 22,
                                            //     ),
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  height10,
                                  // customHeight(30),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CommonButton(
                                          onTap: () {
                                            Get.to(
                                                () => ReservationsDetailScreen(
                                                      data: data,
                                                    ));
                                          },
                                          margin: EdgeInsets.zero,
                                          style: AppTextStyle.regularBold15,
                                          height: 35,
                                          width: 0,
                                          title: "Voir les détails",
                                          borderColor: appBlackColor,
                                          buttonColor: appBlackColor,
                                          titleColor: appWhiteColor,
                                        ),
                                      ),
                                      width15,
                                      width15,
                                      Expanded(
                                        child: CommonButton(
                                          onTap: () {},
                                          margin: EdgeInsets.zero,
                                          style: AppTextStyle.regularBold15,
                                          height: 35,
                                          width: 0,
                                          title: "Supprimer",
                                          borderColor: appBlackColor,
                                          buttonColor: appBlackColor,
                                          titleColor: appWhiteColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
