import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/socket_service.dart';
import 'package:placealouer/common/text_widgets/input_text_field_widget.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/cached_network_image.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/chat_controller/chat_controller.dart';
import 'package:placealouer/main.dart';

final ScrollController scrollController = ScrollController();

void scrollToBottom() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  });
}

class ChatScreen extends StatefulWidget {
  final String name;
  final String conversationId;
  final String imageUrl;
  final String receiverId;
  const ChatScreen(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.conversationId,
      required this.receiverId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = Get.put(ChatController());
  final SocketService socketService = SocketService();

  @override
  void initState() {
    socketConnect();
    chatController.getChat(
        context: context, conversationId: widget.conversationId);
    chatController.chatList.listen((_) => scrollToBottom());

    super.initState();
  }

  void socketConnect() async {
    await socketService.connectSocket();
  }

  void socketDisconnect() async {
    await socketService.disconnectSocket();
  }

  @override
  void dispose() {
    socketDisconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: commonPreferredSize(
          title:
              //  widget.isAide == true
              //     ?
              Row(
        children: [
          widget.imageUrl == ""
              ? Image.asset(
                  "assets/png/pdp 1.png",
                  height: 50,
                  width: 50,
                )
              : SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: NetworkImageWidget(
                      imageUrl: widget.imageUrl,
                    ),
                  ),
                ),
          width10,
          Text(
            widget.name,
            style: AppTextStyle.regularBold20,
          ),
        ],
      )
          // : Row(
          //     // mainAxisAlignment: MainAxisAlignment.,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           Get.to(() => const UserProfile());
          //         },
          //         child: const CircleAvatar(
          //           backgroundColor: Colors.transparent,
          //           backgroundImage: AssetImage("assets/png/pdp 1.png"),
          //         ),
          //       ),
          //       width15,
          //       GestureDetector(
          //         onTap: () {
          //           Get.to(() => const UserProfile());
          //         },
          //         child: Text(
          //           "Léa Dupond",
          //           style: AppTextStyle.regularBold20,
          //         ),
          //       ),
          //       const Spacer(),
          //       Card(
          //         margin: const EdgeInsets.all(5),
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 15, vertical: 5),
          //           child: Column(
          //             children: [
          //               SvgPicture.asset(
          //                 "assets/svg/question.svg",
          //                 height: 20,
          //               ),
          //               Text(
          //                 "Aide",
          //                 style: AppTextStyle.regularBold15
          //                     .copyWith(color: appBlackColor),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
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
                // Transform.rotate(
                //   angle: 45,
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.attach_file_rounded,
                //       color: appWhiteColor,
                //     ),
                //   ),
                // ),
                Expanded(
                  child: textFormField(
                    style: AppTextStyle.normalRegularBold15
                        .copyWith(color: hintTextColor),
                    borderRaduis: 10,
                    controller: chatController.messageController,
                    textStyle: AppTextStyle.normalRegularBold15
                        .copyWith(color: appBlackColor),
                    hintText: "Envoyer un message",
                    hintStyle: AppTextStyle.normalRegularBold12
                        .copyWith(color: hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    suffixIcon: IconButton(
                      onPressed: () {
                        log("-----------? ${widget.receiverId}");
                        log("-----------?user ${box.read("userId")}");
                        socketService.sendMessage(
                          message: chatController.messageController.text,
                          receiver: widget.receiverId,
                        );
                        scrollToBottom();
                        // socket!.emit("sendMessage", {
                        //   "sender": box.read("userId"),
                        //   "receiver": widget.receiverId,
                        //   "msg": chatController.messageController.text
                        // });

                        // socketService.receiveMessage();
                        chatController.messageController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: appBlackColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                        chatController.chatList.length,
                        (index) => Column(
                          crossAxisAlignment:
                              chatController.chatList[index].sender ==
                                      box.read("userId")
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              constraints:
                                  BoxConstraints(maxWidth: Get.width * 0.7),
                              decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      chatController.chatList[index].sender !=
                                              box.read("userId")
                                          ? Radius.zero
                                          : const Radius.circular(10),
                                  topRight:
                                      chatController.chatList[index].sender ==
                                              box.read("userId")
                                          ? Radius.zero
                                          : const Radius.circular(10),
                                  bottomLeft: const Radius.circular(10),
                                  bottomRight: const Radius.circular(10),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(
                                chatController.chatList[index].msg.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );

                // () {
                //   return ListView.builder(
                //     reverse: true,
                //     itemCount: chatController.chatList.length,
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //     itemBuilder: (context, index) {
                //       return Column(
                //         crossAxisAlignment:
                //             chatController.chatList[index].sender ==
                //                     box.read("userId")
                //                 ? CrossAxisAlignment.end
                //                 : CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //             margin: const EdgeInsets.all(5),
                //             constraints:
                //                 BoxConstraints(maxWidth: Get.width * 0.7),
                //             decoration: BoxDecoration(
                //               color: containerColor,
                //               borderRadius: BorderRadius.only(
                //                 topLeft: chatController.chatList[index].sender !=
                //                         box.read("userId")
                //                     ? Radius.zero
                //                     : const Radius.circular(10),
                //                 topRight: chatController.chatList[index].sender ==
                //                         box.read("userId")
                //                     ? Radius.zero
                //                     : const Radius.circular(10),
                //                 bottomLeft: const Radius.circular(10),
                //                 bottomRight: const Radius.circular(10),
                //               ),
                //             ),
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 15, vertical: 10),
                //             child: Text(
                //               chatController.chatList[index].msg.toString(),
                //             ),
                //           ),
                //         ],
                //       );
                //     },
                //   );
              },
            ),
          ),
          // widget.isAide == true
          //     ? const SizedBox()
          //     : Obx(
          //         () => chatController.isBook.value
          //             ? CommonButton(
          //                 title: "Votre demande est en attente",
          //                 height: 40,
          //                 style: AppTextStyle.regularBold15,
          //                 margin: const EdgeInsets.all(10),
          //                 buttonColor: appBlackColor,
          //                 titleColor: appWhiteColor)
          //             : CommonButton(
          //                 title: "Réserver",
          //                 height: 40,
          //                 width: 150,
          //                 onTap: () {
          //                   Get.to(() => const BookScreen());
          //                 },
          //                 style: AppTextStyle.regularBold15,
          //                 margin: const EdgeInsets.all(10),
          //                 buttonColor: appBlackColor,
          //                 titleColor: appWhiteColor),
          //       )
        ],
      ),
    );
  }
}
