import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/common/widget/common_%20button.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/controller/chat_controller/chat_controller.dart';
import 'package:placealouer/view/main_home/message/book/book_screen.dart';
import 'package:placealouer/view/main_home/profile/user_profile/user_profile.dart';

class ChatScreen extends StatefulWidget {
  final bool? isAide;
  const ChatScreen({super.key, this.isAide = false});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: widget.isAide == true
            ? Text(
                "Aide",
                style: AppTextStyle.regularBold20,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const UserProfile());
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/png/pdp 1.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const UserProfile());
                    },
                    child: Text(
                      "Léa Dupond",
                      style: AppTextStyle.regularBold20,
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/question.svg",
                            height: 20,
                          ),
                          Text(
                            "Aide",
                            style: AppTextStyle.regularBold15
                                .copyWith(color: appBlackColor),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xff5ADBE4),
              Color(0xff0552B0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Transform.rotate(
                angle: 45,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.attach_file_rounded,
                    color: appWhiteColor,
                  ),
                ),
              ),
              Expanded(
                child: textFormField(
                  borderRaduis: 10,
                  hintText: "Envoyer un message",
                  hintStyle: AppTextStyle.normalRegularBold12
                      .copyWith(color: appBlackColor),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatController.chatMess.length,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment:
                      chatController.chatMess[index].isSender == true
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      constraints: BoxConstraints(maxWidth: Get.width * 0.7),
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.only(
                          topLeft:
                              chatController.chatMess[index].isSender == false
                                  ? Radius.zero
                                  : const Radius.circular(10),
                          topRight:
                              chatController.chatMess[index].isSender == true
                                  ? Radius.zero
                                  : const Radius.circular(10),
                          bottomLeft: const Radius.circular(10),
                          bottomRight: const Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        chatController.chatMess[index].message.toString(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          widget.isAide == true
              ? const SizedBox()
              : Obx(
                  () => chatController.isBook.value
                      ? CommonButton(
                          title: "Votre demande est en attente",
                          height: 40,
                          style: AppTextStyle.regularBold15,
                          margin: const EdgeInsets.all(10),
                          buttonColor: appBlackColor,
                          titleColor: appWhiteColor)
                      : CommonButton(
                          title: "Réserver",
                          height: 40,
                          width: 150,
                          onTap: () {
                            Get.to(() => const BookScreen());
                          },
                          style: AppTextStyle.regularBold15,
                          margin: const EdgeInsets.all(10),
                          buttonColor: appBlackColor,
                          titleColor: appWhiteColor),
                )
        ],
      ),
    );
  }
}
