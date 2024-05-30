import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/profile_controller/profile_controller.dart';
import 'package:placealouer/main.dart';
import 'package:placealouer/view/inscription/cgu/cgu_view.dart';
import 'package:placealouer/view/inscription/inscription_view.dart';
import 'package:placealouer/view/inscription/privacy_policy/privacy_policy.dart';
import 'package:placealouer/view/main_home/profile/porte-monnaie/porte_monnaie_view.dart';
import 'package:placealouer/view/main_home/profile/update_profile.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      isLeading: false,
      isFooter: false,
      color: containerColor,
      appBarTitle: "COMPTE",
      child: FutureBuilder(
        future: profileController.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(height: Get.height, child: buildShimmerLoading());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData == false || snapshot.data == null) {
            return const Center(
              child: Text("No data found"),
            );
          } else {
            return Obx(
              () {
                return Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          backgroundImage: profileController
                                      .userData.value.profileImg !=
                                  null
                              ? NetworkImage(
                                  profileController.userData.value.profileImg!,
                                ) as ImageProvider
                              : const AssetImage("assets/png/pdp 1.png"),
                        ),
                        width15,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${profileController.userData.value.firstName ?? ""} ${profileController.userData.value.lastName ?? ""}",
                                style: AppTextStyle.regularBold20
                                    .copyWith(color: appBlackColor),
                              ),
                              // RatingBarIndicator(
                              //   itemSize: 20,
                              //   itemCount: 5,
                              //   rating: 2,
                              //   itemBuilder: (context, index) {
                              //     return const Icon(
                              //       Icons.star_sharp,
                              //       color: Colors.amber,
                              //     );
                              //   },
                              // ),
                            ],
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     box.erase();
                        //     Get.offAll(() => const InscriptionScreeen());
                        //   },
                        //   icon: const Icon(
                        //     Icons.logout_outlined,
                        //   ),
                        // )
                      ],
                    ),
                    customHeight(30),
                    // coutomCard(
                    //   iconUrl: "assets/svg/map_pin.svg",
                    //   title: "Mes annonces",
                    //   onTap: () {
                    //     Get.to(() => const MesAnnoncesScreen());
                    //   },
                    // ),
                    coutomCard(
                      iconUrl: "assets/svg/wallet-01.svg",
                      title: "Porte-monnaie",
                      onTap: () {
                        Get.to(() => const PorteMonnaieSacreen());
                      },
                    ),
                    coutomCard(
                      iconUrl: "assets/svg/edit_profile.svg",
                      title: "Editer le profil",
                      onTap: () {
                        Get.to(
                          () => UpdateProfile(
                            userData: profileController.userData.value,
                          ),
                        );
                      },
                    ),
                    coutomCard(
                      iconUrl: "assets/svg/log_out.svg",
                      title: "Se déconnecter",
                      onTap: () {
                        box.erase();
                        Get.offAll(() => const InscriptionScreeen());
                      },
                    ),
                    // coutomCard(
                    //     onTap: () {
                    //       Get.to(
                    //         () => const ChatScreen(
                    //           isAide: true,
                    //         ),
                    //       );
                    //     },
                    //     iconUrl: "assets/svg/help-circle-contained.svg",
                    //     title: "Aide"),
                    height10,
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const PrivacyPolicy());
                      },
                      child: Text(
                        "Politique de confidentialité",
                        style: AppTextStyle.regularBold15.copyWith(
                          fontWeight: FontWeight.w400,
                          color: hintTextColor,
                          fontSize: 12,
                          decorationColor: hintTextColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    height05,
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CguScreen());
                      },
                      child: Text(
                        "Conditions générales d’utilisation",
                        style: AppTextStyle.regularBold15.copyWith(
                          fontWeight: FontWeight.w400,
                          color: hintTextColor,
                          fontSize: 12,
                          decorationColor: hintTextColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  GestureDetector coutomCard(
      {required String iconUrl,
      required String title,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: Get.width,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  iconUrl,
                  height: 45,
                ),
                // height10,
                Text(
                  title,
                  style:
                      AppTextStyle.regularBold20.copyWith(color: appBlackColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
