import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/cached_network_image.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/model/get_booked_parking_model.dart';

class ReservationsDetailScreen extends StatelessWidget {
  final Parking data;
  const ReservationsDetailScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: Text(
            "${data.parkingDetails?.id}",
            style: AppTextStyle.regularBold20,
          ),
          leading: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: Get.width,
            child: PageView.builder(
              onPageChanged: (value) {
                // mesAnnoncesController.changeIndex(value);
              },
              itemCount: data.parkingDetails?.parkingImg?.length,
              itemBuilder: (context, index) => NetworkImageWidget(
                imageUrl: data.parkingDetails!.parkingImg![index],
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                            "${data.parkingDetails?.address?.address} ${data.parkingDetails?.address?.city} ${data.parkingDetails?.address?.state} ${data.parkingDetails?.address?.zip}",
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
                        text: "${data.vehicleType}",
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
                        text: "${data.vehicleName}",
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
                        text: "${data.vehicleNumber}",
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
                            "${DateFormat("EEE, MMM d").format(data.startTime!)} - ${DateFormat("EEE, MMM d").format(data.endTime!)}",
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
