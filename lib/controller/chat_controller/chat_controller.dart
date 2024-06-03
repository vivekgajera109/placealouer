import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/model/get_chat_list_model.dart';
import 'package:placealouer/utils/network/repo.dart';

class ChatController extends GetxController {
  Future<ChatListData?> getChatList({required BuildContext context}) async {
    var res = await ApiRepo.getChatList<GetChatListModel>(context);
    return res.data?.data;
  }

  TextEditingController messageController = TextEditingController();
  RxList<UserChat> chatList = <UserChat>[].obs;
  Future<ChatData?> getChat(
      {required BuildContext context, required String conversationId}) async {
    var res = await ApiRepo.getChat<GetChatModel>(context, conversationId);
    if (res.code == 200) {
      chatList.value = res.data!.data?.chat ?? [];
      chatList.value = chatList.reversed.toList();
      chatList.refresh();
    }
    return res.data?.data;
  }
}

class ChatMessModel {
  String? name;
  bool? isSender;
  String? message;
  DateTime? time;

  ChatMessModel({this.name, this.isSender, this.message, this.time});
}
