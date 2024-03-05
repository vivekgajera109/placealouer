import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/view/main_home/message/chat/chat_screen.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: Text(
          "Messages",
          style: AppTextStyle.regularBold30,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => const ChatScreen());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                child: Card(
                  elevation: 3,
                  color: textFormFieldColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/png/pdp 1.png")),
                        width15,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "TITRE DE L’ANNONCE",
                                style: AppTextStyle.regularBold20
                                    .copyWith(color: appBlackColor),
                              ),
                              customHeight(20),
                              Text(
                                "Début de l’interieur du messages...",
                                style: AppTextStyle.regularBold15
                                    .copyWith(color: appBlackColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
