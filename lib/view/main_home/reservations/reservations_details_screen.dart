import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/cached_network_image.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/mes_annonces_controller/mes_annonces_controller.dart';
import 'package:placealouer/model/get_booked_parking_model.dart';

class ReservationsDetailScreen extends StatefulWidget {
  final Parking data;
  const ReservationsDetailScreen({super.key, required this.data});

  @override
  State<ReservationsDetailScreen> createState() =>
      _ReservationsDetailScreenState();
}

class _ReservationsDetailScreenState extends State<ReservationsDetailScreen> {
  MesAnnoncesController mesAnnoncesController =
      Get.put(MesAnnoncesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: Text(
            "${widget.data.parkingDetails?.parkingName}",
            style: AppTextStyle.regularBold20,
          ),
          leading: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: Get.width,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      mesAnnoncesController.changeIndex(value);
                    },
                    itemCount: widget.data.parkingDetails?.parkingImg?.length,
                    itemBuilder: (context, index) => NetworkImageWidget(
                      imageUrl: widget.data.parkingDetails!.parkingImg![index],
                      fit: BoxFit.cover,
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
                          widget.data.parkingDetails?.parkingImg?.length ?? 0,
                          (index) => Container(
                            height: 12,
                            width: 12,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: mesAnnoncesController.imageIndex.value ==
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
            );
          }),
          height20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Adresse : ",
                    style: AppTextStyle.regularBold15
                        .copyWith(color: appBlackColor),
                    children: [
                      TextSpan(
                        text:
                            "${widget.data.parkingDetails?.address?.address} ${widget.data.parkingDetails?.address?.city} ${widget.data.parkingDetails?.address?.state} ${widget.data.parkingDetails?.address?.zip}",
                        style: AppTextStyle.normalRegularBold15
                            .copyWith(color: hintTextColor),
                      )
                    ],
                  ),
                ),
                height10,
                RichText(
                  text: TextSpan(
                    text: "Type de véhicule : ",
                    style: AppTextStyle.regularBold15
                        .copyWith(color: appBlackColor),
                    children: [
                      TextSpan(
                        text: "${widget.data.vehicleType}",
                        style: AppTextStyle.normalRegularBold15
                            .copyWith(color: hintTextColor),
                      )
                    ],
                  ),
                ),
                height10,
                RichText(
                  text: TextSpan(
                    text: "Nom du véhicule : ",
                    style: AppTextStyle.regularBold15
                        .copyWith(color: appBlackColor),
                    children: [
                      TextSpan(
                        text: "${widget.data.vehicleName}",
                        style: AppTextStyle.normalRegularBold15
                            .copyWith(color: hintTextColor),
                      )
                    ],
                  ),
                ),
                height10,
                RichText(
                  text: TextSpan(
                    text: "Numéro de véhicule : ",
                    style: AppTextStyle.regularBold15
                        .copyWith(color: appBlackColor),
                    children: [
                      TextSpan(
                        text: "${widget.data.vehicleNumber}",
                        style: AppTextStyle.normalRegularBold15
                            .copyWith(color: hintTextColor),
                      )
                    ],
                  ),
                ),
                height10,
                RichText(
                  text: TextSpan(
                    text: "Durée : ",
                    style: AppTextStyle.regularBold15
                        .copyWith(color: appBlackColor),
                    children: [
                      TextSpan(
                        text:
                            "${DateFormat("EEE, MMM d").format(widget.data.startTime!)} - ${DateFormat("EEE, MMM d").format(widget.data.endTime!)}",
                        style: AppTextStyle.normalRegularBold15
                            .copyWith(color: hintTextColor),
                      )
                    ],
                  ),
                ),
                height10,

                // Text(
                //   "Durée : ${DateFormat("EEE, MMM d").format(data.startTime!)} - ${DateFormat("EEE, MMM d").format(data.endTime!)}",
                //   style:
                //       AppTextStyle.regularBold15.copyWith(color: appBlackColor),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
