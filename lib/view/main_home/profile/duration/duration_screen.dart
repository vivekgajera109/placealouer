import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/duration_controller/duration_controller.dart';
import 'package:placealouer/view/main_home/main_home.dart';

class DurationScreen extends StatefulWidget {
  const DurationScreen({super.key});

  @override
  State<DurationScreen> createState() => _DurationScreenState();
}

class _DurationScreenState extends State<DurationScreen> {
  DurationController durationController = Get.put(DurationController());
  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      childFoter: CommonButton(
        title: "Continuer",
        onTap: () {
          Get.offAll(() => const MainHome());
        },
      ),
      color: containerColor,
      isFooter: false,
      appBarTitle: "Durée",
      childScial: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "L’heure de fin est inclue",
          style: AppTextStyle.normalSemiBold10
              .copyWith(color: appBlackColor, fontSize: 12),
        ),
      ),
      child: Obx(
        () {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  durationController.weekName.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        if (durationController.selectedWeek
                            .contains(durationController.weekName[index])) {
                          durationController.selectedWeek
                              .remove(durationController.weekName[index]);
                        } else {
                          durationController.selectedWeek
                              .add(durationController.weekName[index]);
                        }
                        durationController.selectedWeek.sort(
                          (a, b) {
                            return a.key.compareTo(b.key);
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: durationController.selectedWeek
                                  .contains(durationController.weekName[index])
                              ? blueColor
                              : Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              blurStyle: BlurStyle.normal,
                              blurRadius: 5,
                              color: hintTextColor,
                              offset: Offset(2, -0),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: durationController.selectedWeek
                                  .contains(durationController.weekName[index])
                              ? blueColor
                              : appWhiteColor,
                          child: Text(
                            durationController.weekName[index].name![0],
                            style: AppTextStyle.regularBold20
                                .copyWith(color: appBlackColor),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              height10,
              const Divider(
                color: appBlackColor,
                thickness: 1,
              ),
              height10,
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${durationController.selectedWeek[index].name!} :",
                            style: AppTextStyle.regularBold15
                                .copyWith(color: appBlackColor),
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 20,
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: appBlackColor),
                              hintText: "Seléctionner",
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
                        ),
                        width10,
                        Text(
                          "À",
                          style: AppTextStyle.regularBold15
                              .copyWith(color: appBlackColor),
                        ),
                        width10,
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 20,
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: appBlackColor),
                              hintText: "Seléctionner",
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
                        ),
                      ],
                    ),
                  );
                },
                itemCount: durationController.selectedWeek.length,
              )
            ],
          );
        },
      ),
    );
  }
}
