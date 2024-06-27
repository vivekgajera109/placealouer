import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/select_car_controller/select_car_controller.dart';
import 'package:placealouer/utils/process_indicator.dart';

class PaymentScreen extends StatefulWidget {
  final num totalPrice;
  final String parkingId;
  final String vehicleType;
  const PaymentScreen(
      {super.key,
      required this.parkingId,
      required this.vehicleType,
      required this.totalPrice});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  SelectCarController selectCarController = Get.put(SelectCarController());

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      appBarTitle: "Moyen de paiement",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Paiement de",
            style: AppTextStyle.regularBold20.copyWith(color: appBlackColor),
          ),
          height10,
          Row(
            children: [
              Text(
                "Montant",
                style:
                    AppTextStyle.regularBold15.copyWith(color: appBlackColor),
              ),
              const Spacer(),
              Text(
                "${widget.totalPrice}€",
                style:
                    AppTextStyle.regularBold15.copyWith(color: appBlackColor),
              ),
            ],
          ),
          height10,
          Row(
            children: [
              Text(
                "Frais de service (10%)",
                style:
                    AppTextStyle.regularBold15.copyWith(color: appBlackColor),
              ),
              const Spacer(),
              Text(
                "${(widget.totalPrice * 0.1).toStringAsFixed(2)}€",
                style:
                    AppTextStyle.regularBold15.copyWith(color: appBlackColor),
              ),
            ],
          ),
          height20,
          height20,
          Text(
            "Total : ${widget.totalPrice - (widget.totalPrice * 0.1)}€",
            style:
                AppTextStyle.normalRegularBold25.copyWith(color: appBlackColor),
          ),
          customHeight(50),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              // color: appWhiteColor,
              child: Row(
                children: [
                  Image.asset(
                    "assets/png/apple.png",
                    height: 30,
                    width: 30,
                  ),
                  width15,
                  Text(
                    "Apple pay",
                    style: AppTextStyle.normalSemiBold20
                        .copyWith(color: appBlackColor),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: appBlackColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          height10,
          GestureDetector(
            onTap: () async {
              Circle().show(context);
              await selectCarController
                  .bookParkings(widget.parkingId, widget.vehicleType, context)
                  .then((value) {
                // Get.to(() => PaymentScreen(
                //       parkingId: widget.parkingId ?? "",
                //       vehicleType: widget.parkingDetails["vehicleType"],
                //     ));
                Circle().hide(context);
              }).then((value) => Circle().hide(context));
              Circle().hide(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/png/paypal.png",
                    height: 30,
                    width: 30,
                  ),
                  width15,
                  Text(
                    "Apple pay",
                    style: AppTextStyle.normalSemiBold20
                        .copyWith(color: appBlackColor),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: appBlackColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
