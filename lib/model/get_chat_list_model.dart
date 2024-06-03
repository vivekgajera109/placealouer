// To parse this JSON data, do
//
//     final getChatListModel = getChatListModelFromJson(jsonString);

import 'dart:convert';

GetChatListModel getChatListModelFromJson(String str) =>
    GetChatListModel.fromJson(json.decode(str));

String getChatListModelToJson(GetChatListModel data) =>
    json.encode(data.toJson());

class GetChatListModel {
  final bool? success;
  final String? message;
  final ChatListData? data;
  final Error? error;

  GetChatListModel({
    this.success,
    this.message,
    this.data,
    this.error,
  });

  factory GetChatListModel.fromJson(Map<String, dynamic> json) =>
      GetChatListModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ChatListData.fromJson(json["data"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "error": error?.toJson(),
      };
}

class ChatListData {
  final List<Chat>? chat;

  ChatListData({
    this.chat,
  });

  factory ChatListData.fromJson(Map<String, dynamic> json) => ChatListData(
        chat: json["chat"] == null
            ? []
            : List<Chat>.from(json["chat"]!.map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chat": chat == null
            ? []
            : List<dynamic>.from(chat!.map((x) => x.toJson())),
      };
}

class Chat {
  final int? unreadMsg;
  final String? id;
  final String? conversationId;
  final String? firstName;
  final String? msg;
  final String? lastName;
  final String? profileImg;

  Chat({
    this.unreadMsg,
    this.id,
    this.conversationId,
    this.firstName,
    this.msg,
    this.lastName,
    this.profileImg,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        unreadMsg: json["unread_msg"],
        id: json["_id"],
        conversationId: json["conversationId"],
        firstName: json["firstName"],
        msg: json["msg"],
        lastName: json["lastName"],
        profileImg: json["profile_img"],
      );

  Map<String, dynamic> toJson() => {
        "unread_msg": unreadMsg,
        "_id": id,
        "conversationId": conversationId,
        "firstName": firstName,
        "msg": msg,
        "lastName": lastName,
        "profile_img": profileImg,
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}

// To parse this JSON data, do
//
//     final getChatModel = getChatModelFromJson(jsonString);

GetChatModel getChatModelFromJson(String str) =>
    GetChatModel.fromJson(json.decode(str));

String getChatModelToJson(GetChatModel data) => json.encode(data.toJson());

class GetChatModel {
  final bool? success;
  final String? message;
  final ChatData? data;
  final Error? error;

  GetChatModel({
    this.success,
    this.message,
    this.data,
    this.error,
  });

  factory GetChatModel.fromJson(Map<String, dynamic> json) => GetChatModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ChatData.fromJson(json["data"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "error": error?.toJson(),
      };
}

class ChatData {
  final List<UserChat>? chat;

  ChatData({
    this.chat,
  });

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
        chat: json["chat"] == null
            ? []
            : List<UserChat>.from(
                json["chat"]!.map((x) => UserChat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chat": chat == null
            ? []
            : List<dynamic>.from(chat!.map((x) => x.toJson())),
      };
}

class UserChat {
  final String? id;
  final String? sender;
  final String? receiver;
  final String? msg;
  final bool? read;
  final String? conversationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserChat({
    this.id,
    this.sender,
    this.receiver,
    this.msg,
    this.read,
    this.conversationId,
    this.createdAt,
    this.updatedAt,
  });

  factory UserChat.fromJson(Map<String, dynamic> json) => UserChat(
        id: json["_id"],
        sender: json["sender"],
        receiver: json["receiver"],
        msg: json["msg"],
        read: json["read"],
        conversationId: json["conversationId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender,
        "receiver": receiver,
        "msg": msg,
        "read": read,
        "conversationId": conversationId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
