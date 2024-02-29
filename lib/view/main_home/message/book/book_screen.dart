import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/commo_clendar/commo_clendar.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/chat_controller/chat_controller.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
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
            chatController: chatController,
          ),
          height20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          hintStyle: TextStyle(color: appBlackColor),
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
                        hintStyle: TextStyle(color: appBlackColor),
                        hintText: "1h",
                        fillColor: textFormFieldColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      focusColor: textFormFieldColor,
                      icon: const SizedBox.shrink(),
                      items: List.generate(
                        23,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}h"),
                        ),
                      ),
                      onChanged: (value) {},
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
                          hintStyle: TextStyle(color: appBlackColor),
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
                        hintStyle: TextStyle(color: appBlackColor),
                        hintText: "1h*",
                        fillColor: textFormFieldColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      focusColor: textFormFieldColor,
                      icon: const SizedBox.shrink(),
                      items: List.generate(
                        23,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}h*"),
                        ),
                      ),
                      onChanged: (value) {},
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
                      "2h lundi 19/01",
                      style: AppTextStyle.normalSemiBold15
                          .copyWith(color: appBlackColor),
                    ),
                    Text(
                      "2,5€",
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
                      "1j mercredi 21/01",
                      style: AppTextStyle.normalSemiBold15
                          .copyWith(color: appBlackColor),
                    ),
                    Text(
                      "12,5€",
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
                      "Frais de service (10%)",
                      style: AppTextStyle.normalSemiBold15
                          .copyWith(color: appBlackColor),
                    ),
                    Text(
                      "1,50€",
                      style: AppTextStyle.normalSemiBold15
                          .copyWith(color: appBlackColor),
                    ),
                  ],
                ),
                height20,
                height20,
                Center(
                    child: CommonButton(
                  margin: EdgeInsets.zero,
                  onTap: () {
                    chatController.isBook.value = true;
                    Get.back();
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
