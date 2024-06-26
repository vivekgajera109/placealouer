import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/profile_controller/profile_controller.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_screen.dart';

class PorteMonnaieSacreen extends StatefulWidget {
  const PorteMonnaieSacreen({super.key});

  @override
  State<PorteMonnaieSacreen> createState() => _PorteMonnaieSacreenState();
}

class _PorteMonnaieSacreenState extends State<PorteMonnaieSacreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      color: containerColor,
      appBarTitle: "Porte-monnaie",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //       color: appWhiteColor,
            //       borderRadius: BorderRadius.circular(20)),
            //   child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         height20,
            //         Text(
            //           "52,00 €",
            //           style: AppTextStyle.regularBold30
            //               .copyWith(color: appBlackColor),
            //         ),
            //         customHeight(30),
            //         GestureDetector(
            //           onTap: () {
            //             Get.to(() => const TransfertScreen());
            //           },
            //           child: Container(
            //             margin: const EdgeInsets.all(20),
            //             padding: const EdgeInsets.symmetric(
            //                 horizontal: 10, vertical: 5),
            //             decoration: BoxDecoration(
            //               boxShadow: [
            //                 BoxShadow(
            //                     blurRadius: 3,
            //                     spreadRadius: 0.5,
            //                     offset: const Offset(0, 2),
            //                     color: appBlackColor.withOpacity(0.5)),
            //               ],
            //               borderRadius: BorderRadius.circular(20),
            //               gradient: LinearGradient(
            //                 begin: Alignment.topCenter,
            //                 end: Alignment.bottomCenter,
            //                 colors: <Color>[
            //                   const Color(0xff5ADBE4).withOpacity(0.8),
            //                   const Color(0xff0552B0),
            //                 ],
            //               ),
            //             ),
            //             child: Text(
            //               "Transférer vers un compte bancaire ",
            //               style: AppTextStyle.regularBold20,
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         )
            //       ]),
            // ),
            // height20,
            // height20,
            Text(
              "Transactions :",
              style: AppTextStyle.regularBold20.copyWith(color: appBlackColor),
            ),
            height10,
            FutureBuilder(
                future: profileController.getTransection(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                        height: Get.height, child: buildShimmerLoading());
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
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.transection?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data!.transection?[index].type == "PAYMENT" ? "+" : "-"} ${snapshot.data!.transection?[index].totalPay} € ",
                                  // index / 2 == 2
                                  //     ? " -30€ vers : Iban"
                                  //     : "+ 25€ Titre annonce",
                                  style: AppTextStyle.regularBold15.copyWith(
                                      color: appBlackColor, fontSize: 18),
                                ),
                                Text(
                                  "${snapshot.data!.transection?[index].paymentId}",
                                  // index / 2 == 2
                                  //     ? " -30€ vers : Iban"
                                  //     : "+ 25€ Titre annonce",
                                  style: AppTextStyle.regularBold15.copyWith(
                                      color: hintTextColor, fontSize: 10),
                                ),
                              ],
                            ),
                            Text(
                              // "23/01"
                              "${snapshot.data!.transection?[index].createdAt?.day}/${snapshot.data!.transection?[index].createdAt?.month}",
                              style: AppTextStyle.regularBold15
                                  .copyWith(color: appBlackColor, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
