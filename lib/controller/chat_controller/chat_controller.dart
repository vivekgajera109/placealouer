import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<ChatMessModel> chatMess = <ChatMessModel>[
    ChatMessModel(
      name: "Divyesh",
      isSender: false,
      message: "Hello",
      time: DateTime.now(),
    ),
    ChatMessModel(
      name: "Léa Dupond",
      isSender: true,
      message: "Hello",
      time: DateTime.now(),
    ),
    ChatMessModel(
      name: "Divyesh",
      isSender: false,
      message:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      time: DateTime.now(),
    ),
    ChatMessModel(
      name: "Léa Dupond",
      isSender: true,
      message:
          " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
      time: DateTime.now(),
    ),
  ].obs;
  RxList<DateTime?> rangeDatePickerValueWithDefaultValue = <DateTime?>[].obs;
  RxBool isBook = false.obs;
}

class ChatMessModel {
  String? name;
  bool? isSender;
  String? message;
  DateTime? time;

  ChatMessModel({this.name, this.isSender, this.message, this.time});
}
