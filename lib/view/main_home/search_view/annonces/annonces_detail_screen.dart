import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/cached_network_image.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/mes_annonces_controller/mes_annonces_controller.dart';
import 'package:placealouer/view/main_home/message/chat/chat_screen.dart';
import 'package:placealouer/view/main_home/profile/select_car/select_car_screen.dart';
import 'package:placealouer/view/main_home/profile/user_profile/user_profile.dart';

class AnnoncesDetailScreen extends StatefulWidget {
  final String parkingId;
  const AnnoncesDetailScreen({super.key, required this.parkingId});

  @override
  State<AnnoncesDetailScreen> createState() => _AnnoncesDetailScreenState();
}

class _AnnoncesDetailScreenState extends State<AnnoncesDetailScreen> {
  MesAnnoncesController mesAnnoncesController =
      Get.put(MesAnnoncesController());

  @override
  void initState() {
    mesAnnoncesController.imageIndex.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: mesAnnoncesController.getParkingsId(widget.parkingId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData == false || snapshot.data == null) {
                  return const Center(
                    child: Text("No data found"),
                  );
                } else {
                  return Obx(() {
                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 300,
                              width: Get.width,
                              child: PageView.builder(
                                onPageChanged: (value) {
                                  mesAnnoncesController.changeIndex(value);
                                },
                                itemCount: mesAnnoncesController
                                    .parkingDetails.value.parkingImg?.length,
                                itemBuilder: (context, index) =>
                                    NetworkImageWidget(
                                  imageUrl: mesAnnoncesController
                                      .parkingDetails.value.parkingImg![index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 25,
                                  color: appWhiteColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: SizedBox(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                      mesAnnoncesController.parkingDetails.value
                                              .parkingImg?.length ??
                                          0,
                                      (index) => Container(
                                        height: 12,
                                        width: 12,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: mesAnnoncesController
                                                      .imageIndex.value ==
                                                  index
                                              ? appWhiteColor
                                              : appBlackColor.withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        height10,
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${mesAnnoncesController.parkingDetails.value.parkingName}"
                                .toUpperCase(),
                            style: AppTextStyle.regularBold25
                                .copyWith(color: appBlackColor),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: containerColor),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => UserProfile(
                                                vendor: mesAnnoncesController
                                                    .parkingDetails
                                                    .value
                                                    .vendor));
                                          },
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: mesAnnoncesController
                                                        .parkingDetails
                                                        .value
                                                        .vendor
                                                        ?.profileImg ==
                                                    null
                                                ? const AssetImage(
                                                        "assets/png/pdp 1.png")
                                                    as ImageProvider
                                                : NetworkImage(
                                                    mesAnnoncesController
                                                            .parkingDetails
                                                            .value
                                                            .vendor
                                                            ?.profileImg ??
                                                        ""),
                                          ),
                                        ),
                                        width15,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${mesAnnoncesController.parkingDetails.value.vendor?.firstName} ${mesAnnoncesController.parkingDetails.value.vendor?.lastName}",
                                                style: AppTextStyle
                                                    .regularBold20
                                                    .copyWith(
                                                        color: appBlackColor),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              RatingBarIndicator(
                                                itemSize: 20,
                                                itemCount: 5,
                                                rating: mesAnnoncesController
                                                        .parkingDetails
                                                        .value
                                                        .vendor
                                                        ?.avgRating
                                                        ?.toDouble() ??
                                                    0.0,
                                                itemBuilder: (context, index) {
                                                  return const Icon(
                                                    Icons.star_sharp,
                                                    color: Colors.amber,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CommonButton(
                                    title:
                                        "${mesAnnoncesController.parkingDetails.value.parkingDetails?[0].pricePerHour}€/Jours",
                                    style: AppTextStyle.regularBold15,
                                    height: 25,
                                    buttonColor: appBlackColor,
                                    width: 80,
                                    margin: EdgeInsets.zero,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/png/code_1.png",
                                      height: 40,
                                    ),
                                    width10,
                                    Expanded(
                                      child: Text(
                                        "L’accès à la location s’effectue avec un code.",
                                        style: AppTextStyle.regularBold15
                                            .copyWith(color: appBlackColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svg/alarm.svg",
                                      height: 32,
                                    ),
                                    width10,
                                    Expanded(
                                      child: Text(
                                        "Envoie automatique du code, le propriétaire valide immédiatement la réservation",
                                        style: AppTextStyle.regularBold15
                                            .copyWith(color: appBlackColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "${mesAnnoncesController.parkingDetails.value.description}",
                                style: AppTextStyle.regularBold15
                                    .copyWith(color: appBlackColor),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
                }
              })),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            blurRadius: 10,
            color: hintTextColor,
            offset: Offset(0, -5),
          ),
        ], color: appWhiteColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                child: CommonButton(
                  onTap: () {
                    // 665ac569ff7be19a2bedaad0 p
                    // 665ac569ff7be19a2bedaad0 d

                    log("conversationId message : ${mesAnnoncesController.parkingDetails.value.vendorId}");
                    mesAnnoncesController
                        .getConversationId(
                            context,
                            mesAnnoncesController
                                    .parkingDetails.value.vendorId ??
                                "")
                        .then(
                      (value) {
                        log("conversationId message : conversation id : ${value["data"]["conversationId"]}");
                        return Get.to(
                          () => ChatScreen(
                            // senderId: userController.user.value.id ?? "",
                            imageUrl: mesAnnoncesController
                                    .parkingDetails.value.vendor?.profileImg ??
                                "",
                            conversationId: value["data"]["conversationId"],
                            receiverId: mesAnnoncesController
                                    .parkingDetails.value.vendorId ??
                                "",
                            name:
                                "${mesAnnoncesController.parkingDetails.value.vendor?.firstName} ${mesAnnoncesController.parkingDetails.value.vendor?.lastName}",
                          ),
                        );
                      },
                    );
                  },
                  height: 40,
                  title: "Contacter",
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  style: AppTextStyle.regularBold15,
                  borderColor: appBlackColor,
                  buttonColor: appBlackColor,
                ),
              ),
              width15,
              Expanded(
                child: CommonButton(
                  onTap: () {
                    // Get.to(() => const BookScreen());
                    Get.to(() => SelectCarScreen(
                          parkingId:
                              mesAnnoncesController.parkingDetails.value.id ??
                                  "",
                        ));
                  },
                  height: 40,
                  title: "Réserver",
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  style: AppTextStyle.regularBold15,
                  borderColor: appBlackColor,
                  buttonColor: appBlackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
