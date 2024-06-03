import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:placealouer/common/appbar/common_appbar.dart';
import 'package:placealouer/common/socket_service.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';
import 'package:placealouer/controller/chat_controller/chat_controller.dart';
import 'package:placealouer/main.dart';
import 'package:placealouer/view/main_home/message/chat/chat_screen.dart';
import 'package:placealouer/view/main_home/search_view/annonces/annonces_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  ChatController chatController = Get.put(ChatController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocketService().connectSocket();
  }

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
      body: FutureBuilder(
          future: chatController.getChatList(context: context),
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
              return ListView.builder(
                itemCount: snapshot.data?.chat?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      log("conversationId----=--> ${snapshot.data?.chat![index].conversationId}");
                      socket!
                          .emit('connect_user', {"userid": box.read("userId")});
                      // socket!
                      //     .emit('connect_user', {"userid": box.read("userId")});
                      Get.to(() => ChatScreen(
                            imageUrl:
                                snapshot.data?.chat![index].profileImg ?? "",
                            receiverId: snapshot.data?.chat![index].id ?? "",
                            conversationId:
                                snapshot.data?.chat![index].conversationId ??
                                    "",
                            name:
                                "${snapshot.data?.chat?[index].firstName} ${snapshot.data?.chat?[index].lastName}",
                          ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15),
                        child: Card(
                          elevation: 3,
                          color: textFormFieldColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 30,
                                  backgroundImage: snapshot
                                              .data?.chat?[index].profileImg ==
                                          null
                                      ? const AssetImage("assets/png/pdp 1.png")
                                          as ImageProvider
                                      : NetworkImage(
                                          snapshot.data?.chat?[index]
                                                  .profileImg ??
                                              "",
                                        ),
                                ),
                                width15,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data?.chat?[index].firstName} ${snapshot.data?.chat?[index].lastName}",
                                        style: AppTextStyle.regularBold20
                                            .copyWith(color: appBlackColor),
                                      ),
                                      customHeight(20),
                                      Text(
                                        "${snapshot.data?.chat?[index].msg}",
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
              );
            }
          }),
    );
  }
}
