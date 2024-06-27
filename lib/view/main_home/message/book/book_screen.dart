import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/commo_clendar/commo_clendar.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/select_car_controller/select_car_controller.dart';
import 'package:placealouer/view/payment_screen.dart';

class BookScreen extends StatefulWidget {
  final dynamic parkingDetails;
  final String? parkingId;
  const BookScreen({super.key, this.parkingDetails, this.parkingId});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    SelectCarController selectCarController = Get.put(SelectCarController());
    return Scaffold(
      appBar: commonAppBar(
        title: Text(
          "Réserver",
          style: AppTextStyle.regularBold20,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          commonClendar(
            chatController: selectCarController,
            setState1: setState,
          ),
          height20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Les détails du véhicule :",
                  style: AppTextStyle.regularBold15
                      .copyWith(color: appBlackColor, fontSize: 18),
                ),
                height10,
                TextFormField(
                  controller: selectCarController.vehicleNameController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30.0),
                        right: Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Nom du véhicule",
                    fillColor: textFormFieldColor,
                  ),
                ),
                height10,
                TextFormField(
                  controller: selectCarController.vehicleNumberController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30.0),
                        right: Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Numéro de véhicule",
                    fillColor: textFormFieldColor,
                  ),
                ),
                height10,
                Text(
                  "Réservation du :",
                  style: AppTextStyle.regularBold15
                      .copyWith(color: appBlackColor, fontSize: 18),
                ),
                height10,
                Row(children: [
                  Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller:
                            selectCarController.firstDateController.value,
                        readOnly: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 10,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "18 janvier",
                          fillColor: textFormFieldColor,
                        ),
                      )),
                  const SizedBox(
                    height: 48,
                    child: VerticalDivider(
                      thickness: 1,
                      endIndent: 0,
                      indent: 0,
                      width: 1,
                      color: appBlackColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField(
                      isDense: true,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30.0),
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 20,
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Sélectionnez les heures",
                        fillColor: textFormFieldColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      focusColor: textFormFieldColor,
                      icon: const SizedBox.shrink(),
                      items: List.generate(
                        24,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}h"),
                        ),
                      ),
                      onChanged: (value) {
                        selectCarController.firstHour.value = value ?? 0;
                      },
                    ),
                  )
                ]),
                height20,
                Center(
                  child: Text(
                    "Jusqu’au",
                    style: AppTextStyle.regularBold15
                        .copyWith(color: appBlackColor, fontSize: 18),
                  ),
                ),
                height20,
                Row(children: [
                  Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller:
                            selectCarController.lastDateController.value,
                        readOnly: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 10,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "24 janvier",
                          fillColor: textFormFieldColor,
                        ),
                      )),
                  const SizedBox(
                    height: 48,
                    child: VerticalDivider(
                      thickness: 1,
                      endIndent: 0,
                      indent: 0,
                      width: 1,
                      color: appBlackColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField(
                      isDense: true,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30.0),
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 20,
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Sélectionnez les heures*",
                        fillColor: textFormFieldColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      focusColor: textFormFieldColor,
                      icon: const SizedBox.shrink(),
                      items: List.generate(
                        24,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}h*"),
                        ),
                      ),
                      onChanged: (value) {
                        selectCarController.lastHour.value = value ?? 0;
                        log("-=-=-=-=   ${selectCarController.lastHour}");
                      },
                    ),
                  )
                ]),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "*inclus",
                    style: AppTextStyle.normalSemiBold10
                        .copyWith(color: appBlackColor, fontSize: 12),
                  ),
                ),
                height20,
                height10,
                Obx(() => selectCarController.firstDateController.value.text !=
                        ""
                    ? Column(
                        children: [
                          Text(
                            "Total :",
                            style: AppTextStyle.regularBold15
                                .copyWith(color: appBlackColor, fontSize: 24),
                          ),
                          height15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Heures totales",
                                style: AppTextStyle.normalSemiBold15
                                    .copyWith(color: appBlackColor),
                              ),
                              Obx(() {
                                return Text(
                                  "${selectCarController.dateRange.value * 24 - (selectCarController.firstHour.value) - (24 - selectCarController.lastHour.value)} h",
                                  style: AppTextStyle.normalSemiBold15
                                      .copyWith(color: appBlackColor),
                                );
                              }),
                            ],
                          ),
                          height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Prix ​​par heure",
                                style: AppTextStyle.normalSemiBold15
                                    .copyWith(color: appBlackColor),
                              ),
                              Text(
                                "${widget.parkingDetails["pricePerHour"]}€",
                                style: AppTextStyle.normalSemiBold15
                                    .copyWith(color: appBlackColor),
                              ),
                            ],
                          ),
                          height10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Charge totale",
                                style: AppTextStyle.normalSemiBold15
                                    .copyWith(color: appBlackColor),
                              ),
                              Obx(
                                () {
                                  selectCarController
                                      .totalHoures.value = (selectCarController
                                              .dateRange.value *
                                          24) -
                                      (selectCarController.firstHour.value) -
                                      (24 - selectCarController.lastHour.value);
                                  return Text(
                                    "${(selectCarController.totalHoures.value * widget.parkingDetails["pricePerHour"])}€",
                                    style: AppTextStyle.normalSemiBold15
                                        .copyWith(color: appBlackColor),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox()),
                height20,
                height20,
                Center(
                    child: CommonButton(
                  margin: EdgeInsets.zero,
                  onTap: () {
                    Get.to(() => PaymentScreen(
                          totalPrice:
                              ((selectCarController.dateRange.value * 24) -
                                  (selectCarController.firstHour.value) -
                                  (24 - selectCarController.lastHour.value) *
                                      widget.parkingDetails["pricePerHour"]),
                          parkingId: widget.parkingId ?? "",
                          vehicleType: widget.parkingDetails["vehicleType"],
                        ));
                    // Circle().show(context);
                    // await selectCarController
                    //     .bookParkings(widget.parkingId ?? "",
                    //         widget.parkingDetails["vehicleType"], context)
                    //     .then((value) {
                    //   Get.to(() => PaymentScreen(
                    //         parkingId: widget.parkingId ?? "",
                    //         vehicleType: widget.parkingDetails["vehicleType"],
                    //       ));
                    //   Circle().hide(context);
                    // }).then((value) => Circle().hide(context));
                    // Circle().hide(context);
                    // chatController.isBook.value = true;
                    // Get.back();
                  },
                  borderColor: buttonColor,
                  titleColor: appWhiteColor,
                  buttonColor: buttonColor,
                  title: "VALIDER",
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
