import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:placealouer/common/background/common_background.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundAuth(
      color: containerColor,
      appBarTitle: "Avis",
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/png/pdp 1.png",
                ),
              ),
              width15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Léa Dupond",
                    style: AppTextStyle.regularBold20
                        .copyWith(color: appBlackColor),
                  ),
                  RatingBarIndicator(
                    itemSize: 20,
                    itemCount: 5,
                    rating: 4,
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
                      child: RatingBarIndicator(
                        itemSize: 25,
                        itemCount: 5,
                        rating: 2,
                        itemBuilder: (context, index) {
                          return const Icon(
                            Icons.star_sharp,
                            color: Colors.amber,
                          );
                        },
                      ),
                    );
                  }),
                  textFormField(
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
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                color: appWhiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Builder(builder: (context) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: RatingBarIndicator(
                            itemSize: 25,
                            itemCount: 5,
                            rating: 4,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star_sharp,
                                color: Colors.amber,
                              );
                            },
                          ),
                        );
                      }),
                      height05,
                      textFormField(
                        filledColor: Colors.transparent,
                        maxLines: 5,
                        readonly: true,
                        enabled: true,
                        hintText: "Tout c’est bien passé, très bon emplacement",
                        textStyle: AppTextStyle.regularBold15
                            .copyWith(color: appBlackColor),
                        hintStyle: AppTextStyle.regularBold20
                            .copyWith(color: appBlackColor),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
