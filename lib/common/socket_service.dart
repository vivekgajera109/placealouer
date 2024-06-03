import 'dart:developer';
import 'package:get/get.dart';
import 'package:placealouer/controller/chat_controller/chat_controller.dart';
import 'package:placealouer/main.dart';
import 'package:placealouer/model/get_chat_list_model.dart';
import 'package:placealouer/view/main_home/message/chat/chat_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket? socket;

class SocketService {
  Future connectSocket() async {
    try {
      socket = IO.io(
          "https://api.placealouer.in",
          IO.OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .disableAutoConnect() // disable auto-connection
              .build());

      socket!.connect();
      socket!.onConnect(
        (data) {
          log("message On Connect");
          socket!.emit(
            "connect_user",
            {
              "userid": box.read("userId"),
            },
          );

          receiveMessage();
        },
      );
      socket!.onConnectTimeout((data) => {log("check message -->$data")});
      socket!
          .onConnectError((data) => log('check message connect error $data'));
    } catch (e) {
      log("Connection error $e");
    }
  }

  Future disconnectSocket() async {
    socket!.disconnect();
    socket!.dispose();
  }

  Future sendMessage(
      {required String message, required String receiver}) async {
    socket!.emit("sendMessage",
        {"sender": box.read("userId"), "receiver": receiver, "msg": message});
    Get.find<ChatController>().chatList.add(
          UserChat(
            conversationId: "",
            msg: message,
            receiver: receiver,
            sender: box.read("userId"),
            read: false,
          ),
        );
    Get.find<ChatController>().update();
  }

  Future receiveMessage() async {
    socket!.on("receiveMessage", (message) {
      Get.find<ChatController>().chatList.add(UserChat.fromJson(message));
      Get.find<ChatController>().update();
    });
    scrollToBottom();
    socket!.on("connect_user", (data) => log("connect_user $data"));
  }
}
