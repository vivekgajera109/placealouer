import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/dialog/common_dialog.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/profile_controller/profile_controller.dart';
import 'package:placealouer/main.dart';
import 'package:placealouer/model/get_parking_model.dart';
import 'package:placealouer/utils/process_indicator.dart';

class UserProfile extends StatefulWidget {
  final Vendor? vendor;

  const UserProfile({super.key, this.vendor});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    log("vendor ${widget.vendor?.id}");
    return CommonBackgroundAuth(
      color: containerColor,
      appBarTitle: "Avis",
      isFooter: false,
      child: FutureBuilder(
        future:
            profileController.getRatingAndReview(vendorId: widget.vendor?.id),
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
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: widget.vendor?.profileImg != null
                          ? NetworkImage(
                              widget.vendor?.profileImg ?? "",
                            ) as ImageProvider
                          : const AssetImage("assets/png/pdp 1.png"),
                    ),
                    width15,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.vendor?.firstName ?? ''} ${widget.vendor?.lastName ?? ''}",
                          style: AppTextStyle.regularBold20
                              .copyWith(color: appBlackColor),
                        ),
                        RatingBarIndicator(
                          itemSize: 20,
                          itemCount: 5,
                          rating: double.parse(snapshot.data["data"]["rating"]
                                  ["avgRating"]
                              .toString()),
                          itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star_sharp,
                              color: Colors.amber,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                height20,
                Card(
                  elevation: 5,
                  color: appWhiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Builder(builder: (context) {
                          return Align(
                            alignment: Alignment.topRight,
                            child: RatingBar.builder(
                              itemSize: 25,
                              itemCount: 5,
                              initialRating: profileController.rating.value,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (_) {
                                profileController.rating.value = _;
                                print(_);
                              },
                            ),
                          );
                        }),
                        textFormField(
                          controller: profileController.reviewController,
                          filledColor: Colors.transparent,
                          maxLines: 5,
                          hintText: "Laisser un avis",
                          textStyle: AppTextStyle.regularBold15
                              .copyWith(color: appBlackColor),
                          hintStyle: AppTextStyle.regularBold15
                              .copyWith(color: hintTextColor),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                        ),
                        height10,
                        CommonButton(
                          title: "Ajouter",
                          onTap: () {
                            Circle().show(context);
                            profileController.addRating(widget.vendor!.id!);
                            Circle().hide(context);
                          },
                          height: 40,
                          width: 150,
                          radius: 10,
                          margin: EdgeInsets.zero,
                        )
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (snapshot.data["data"]["review"].toList()).length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 4),
                      color: appWhiteColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: RatingBarIndicator(
                                      itemSize: 25,
                                      itemCount: 5,
                                      // rating: 3,
                                      rating: double.parse(snapshot.data["data"]
                                              ["review"][index]["rating"]
                                          .toString()),
                                      itemBuilder: (context, index) {
                                        return const Icon(
                                          Icons.star_sharp,
                                          color: Colors.amber,
                                        );
                                      },
                                    ),
                                  ),
                                  height05,
                                  Text(
                                    snapshot.data["data"]["review"][index]
                                        ["review"],
                                    style: AppTextStyle.regularBold20
                                        .copyWith(color: appBlackColor),
                                  )
                                ],
                              ),
                            ),
                            // Text(
                            //     "${snapshot.data["data"][index]["userId"].toString()}"),
                            snapshot.data["data"]["review"][index]["userId"]
                                        .toString() ==
                                    box.read("userId").toString()
                                ? IconButton(
                                    onPressed: () {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return BlurryDialog(
                                            "Supprimer l'avis",
                                            "Êtes-vous sûr de vouloir supprimer l'avis ?",
                                            () async {
                                              Circle().show(context);
                                              log("----->>> ${snapshot.data["data"]["review"][index]["_id"]}");
                                              // mainHomeController
                                              //     .bookParkingsCancel(
                                              //   context: context,
                                              //   bookedParkingId: data.id!,
                                              // );
                                              profileController.deleteRating(
                                                  snapshot.data["data"]
                                                      ["review"][index]["_id"]);
                                              Circle().hide(context);
                                            },
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.delete),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            );
          }
        },
      ),
    );
  }
}
