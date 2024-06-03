// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:placealouer/common/appbar/common_appbar.dart';
// import 'package:placealouer/common/widget/common_%20button.dart';
// import 'package:placealouer/constant/app_style.dart';
// import 'package:placealouer/constant/static_decoration.dart';
// import 'package:placealouer/controller/mes_annonces_controller/mes_annonces_controller.dart';
// import 'package:placealouer/model/get_parking_model.dart';
// import 'package:placealouer/view/main_home/Information_screen.dart';
// import 'package:placealouer/view/main_home/search_view/annonces/annonces_detail_screen.dart';

// import '../../../../constant/app_colors.dart';

// class AnnoncesScreen extends StatefulWidget {
//   const AnnoncesScreen({super.key});

//   @override
//   State<AnnoncesScreen> createState() => _AnnoncesScreenState();
// }

// class _AnnoncesScreenState extends State<AnnoncesScreen> {
//   MesAnnoncesController mesAnnoncesController =
//       Get.put(MesAnnoncesController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: commonAppBar(
//         title: Text(
//           "Annonces".toUpperCase(),
//           style: AppTextStyle.regularBold20,
//         ),
//       ),
//       floatingActionButton: CommonButton(
//         onTap: () {
//           Get.back();
//         },
//         title: "CARTE",
//         buttonColor: buttonColor,
//         borderColor: buttonColor,
//         titleColor: appWhiteColor,
//         margin: const EdgeInsets.only(bottom: 20),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       body: FutureBuilder(
//           future: mesAnnoncesController.getParkings(context),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text(snapshot.error.toString()),
//               );
//             } else if (snapshot.hasData == false || snapshot.data == null) {
//               return const Center(
//                 child: Text("No data found"),
//               );
//             } else {
//               return Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: appBlackColor.withOpacity(0.6),
//                         ),
//                         contentPadding: const EdgeInsets.all(10),
//                         hintStyle: TextStyle(
//                           color: appBlackColor.withOpacity(0.6),
//                         ),
//                         hintText: "Entrer une adresse",
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(10)),
//                         filled: true,
//                         fillColor: textFormFieldColor,
//                       ),
//                     ),
//                   ),
//                   height10,
//                   Row(
//                     children: [
//                       const Expanded(
//                           child: Divider(
//                         color: appBlackColor,
//                       )),
//                       width10,
//                       const Icon(Icons.info_outline),
//                       GestureDetector(
//                         onTap: () {
//                           Get.to(() => const InformationScreen());
//                         },
//                         child: Text(
//                           "Information sur les icônes",
//                           style: AppTextStyle.normalSemiBold15.copyWith(
//                             color: appBlackColor,
//                           ),
//                         ),
//                       ),
//                       width10,
//                       const Expanded(
//                         child: Divider(
//                           color: appBlackColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   height10,
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: mesAnnoncesController.parking.length,
//                       // shrinkWrap: true,
//                       // physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         Parking item = mesAnnoncesController.parking[index];
//                         return GestureDetector(
//                           onTap: () {
//                             Get.to(
//                               () => AnnoncesDetailScreen(
//                                 parkingId: item.id.toString(),
//                               ),
//                             );
//                           },
//                           child: Card(
//                             elevation: 3,
//                             margin: const EdgeInsets.all(15),
//                             color: containerColor,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               child: Image.network(
//                                                 "${item.parkingImg?[0]}",
//                                                 height: 80,
//                                                 fit: BoxFit.cover,
//                                               )),
//                                         ),
//                                         Expanded(
//                                           child: Row(
//                                             children: [
//                                               width10,
//                                               index * 2 == 0
//                                                   ? SvgPicture.asset(
//                                                       "assets/svg/alarm.svg",
//                                                       height: 22,
//                                                     )
//                                                   : Image.asset(
//                                                       "assets/png/code_1.png",
//                                                       height: 32,
//                                                     ),
//                                               width10,
//                                               index * 2 == 0
//                                                   ? SvgPicture.asset(
//                                                       "assets/svg/code_1.svg",
//                                                       height: 22,
//                                                     )
//                                                   : SvgPicture.asset(
//                                                       "assets/svg/plug.svg",
//                                                       height: 22,
//                                                     ),
//                                             ],
//                                           ),
//                                         ),
//                                         CircleAvatar(
//                                           backgroundColor: Colors.transparent,
//                                           radius: 30,
//                                           backgroundImage: item
//                                                       .vendor?.profileImg ==
//                                                   null
//                                               ? const AssetImage(
//                                                       "assets/png/pdp 1.png")
//                                                   as ImageProvider
//                                               : NetworkImage(
//                                                   item.vendor?.profileImg ??
//                                                       ""),
//                                         ),
//                                       ]),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       RatingBarIndicator(
//                                         itemSize: 20,
//                                         itemCount: 5,
//                                         rating:
//                                             item.avgrating?.toDouble() ?? 0.0,
//                                         itemBuilder: (context, index) {
//                                           return const Icon(
//                                             Icons.star_sharp,
//                                             color: Colors.amber,
//                                           );
//                                         },
//                                       ),
//                                       width15,
//                                       Text(
//                                         "à 1.4 km",
//                                         style:
//                                             AppTextStyle.regularBold20.copyWith(
//                                           color: const Color(0xff247892),
//                                         ),
//                                       ),
//                                       width10,
//                                       CommonButton(
//                                         title:
//                                             "${item.parkingDetails?.isEmpty ?? true ? 0 : item.parkingDetails?[0].pricePerHour}€/Jours",
//                                         style: AppTextStyle.regularBold15,
//                                         height: 25,
//                                         buttonColor: appBlackColor,
//                                         width: 85,
//                                         margin: EdgeInsets.zero,
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               );
//             }
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/cached_network_image.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/mes_annonces_controller/mes_annonces_controller.dart';
import 'package:placealouer/model/get_parking_model.dart';
import 'package:placealouer/view/main_home/Information_screen.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_detail_screen.dart';
import 'package:shimmer/shimmer.dart'; // Add this line

import '../../../../constant/app_colors.dart';

class AnnoncesScreen extends StatefulWidget {
  const AnnoncesScreen({super.key});

  @override
  State<AnnoncesScreen> createState() => _AnnoncesScreenState();
}

class _AnnoncesScreenState extends State<AnnoncesScreen> {
  MesAnnoncesController mesAnnoncesController =
      Get.put(MesAnnoncesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: Text(
          "Annonces".toUpperCase(),
          style: AppTextStyle.regularBold20,
        ),
      ),
      floatingActionButton: CommonButton(
        onTap: () {
          Get.back();
        },
        title: "CARTE",
        buttonColor: buttonColor,
        borderColor: buttonColor,
        titleColor: appWhiteColor,
        margin: const EdgeInsets.only(bottom: 20),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder(
        future: mesAnnoncesController.getParkings(searchValue: ""),
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
            return _buildContent();
          }
        },
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (value) {
              // mesAnnoncesController
              mesAnnoncesController.getParkings(searchValue: value);

              // setState(() {});
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: appBlackColor.withOpacity(0.6),
              ),
              contentPadding: const EdgeInsets.all(10),
              hintStyle: TextStyle(
                color: appBlackColor.withOpacity(0.6),
              ),
              hintText: "Entrer une adresse",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: textFormFieldColor,
            ),
          ),
        ),
        height10,
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: appBlackColor,
              ),
            ),
            width10,
            const Icon(Icons.info_outline),
            GestureDetector(
              onTap: () {
                Get.to(() => const InformationScreen());
              },
              child: Text(
                "Information sur les icônes",
                style: AppTextStyle.normalSemiBold15.copyWith(
                  color: appBlackColor,
                ),
              ),
            ),
            width10,
            const Expanded(
              child: Divider(
                color: appBlackColor,
              ),
            ),
          ],
        ),
        height10,
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: mesAnnoncesController.parking.length,
              itemBuilder: (context, index) {
                Parking item = mesAnnoncesController.parking[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => AnnoncesDetailScreen(
                        parkingId: item.id.toString(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(15),
                    color: containerColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: NetworkImageWidget(
                                    imageUrl: "${item.parkingImg?[0]}",
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    width10,
                                    index * 2 == 0
                                        ? SvgPicture.asset(
                                            "assets/svg/alarm.svg",
                                            height: 22,
                                          )
                                        : Image.asset(
                                            "assets/png/code_1.png",
                                            height: 32,
                                          ),
                                    width10,
                                    index * 2 == 0
                                        ? SvgPicture.asset(
                                            "assets/svg/code_1.svg",
                                            height: 22,
                                          )
                                        : SvgPicture.asset(
                                            "assets/svg/plug.svg",
                                            height: 22,
                                          ),
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30,
                                backgroundImage: item.vendor?.profileImg == null
                                    ? const AssetImage("assets/png/pdp 1.png")
                                        as ImageProvider
                                    : NetworkImage(
                                        item.vendor?.profileImg ?? ""),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RatingBarIndicator(
                                itemSize: 20,
                                itemCount: 5,
                                rating:
                                    item.vendor?.avgRating?.toDouble() ?? 0.0,
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    Icons.star_sharp,
                                    color: Colors.amber,
                                  );
                                },
                              ),
                              width15,
                              Text(
                                "à 1.4 km",
                                style: AppTextStyle.regularBold20.copyWith(
                                  color: const Color(0xff247892),
                                ),
                              ),
                              width10,
                              CommonButton(
                                title:
                                    "${item.parkingDetails?.isEmpty ?? true ? 0 : item.parkingDetails?[0].pricePerHour}€/Jours",
                                style: AppTextStyle.regularBold15,
                                height: 25,
                                buttonColor: appBlackColor,
                                width: 85,
                                margin: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

Widget buildShimmerLoading() {
  return ListView.builder(
    itemCount: 6,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 20.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 20.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
