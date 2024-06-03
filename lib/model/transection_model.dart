// To parse this JSON data, do
//
//     final transectionModel = transectionModelFromJson(jsonString);

import 'dart:convert';

TransectionModel transectionModelFromJson(String str) =>
    TransectionModel.fromJson(json.decode(str));

String transectionModelToJson(TransectionModel data) =>
    json.encode(data.toJson());

class TransectionModel {
  final bool? success;
  final String? message;
  final TransectionData? data;
  final Error? error;

  TransectionModel({
    this.success,
    this.message,
    this.data,
    this.error,
  });

  factory TransectionModel.fromJson(Map<String, dynamic> json) =>
      TransectionModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : TransectionData.fromJson(json["data"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "error": error?.toJson(),
      };
}

class TransectionData {
  final List<Transection>? transection;

  TransectionData({
    this.transection,
  });

  factory TransectionData.fromJson(Map<String, dynamic> json) =>
      TransectionData(
        transection: json["transection"] == null
            ? []
            : List<Transection>.from(
                json["transection"]!.map((x) => Transection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transection": transection == null
            ? []
            : List<dynamic>.from(transection!.map((x) => x.toJson())),
      };
}

class Transection {
  final String? id;
  final String? paymentId;
  final String? parkingId;
  final String? vendorId;
  final String? userId;
  final String? status;
  final int? totalPay;
  final double? adminPay;
  final double? vendorPay;
  final int? refund;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Transection({
    this.id,
    this.paymentId,
    this.parkingId,
    this.vendorId,
    this.userId,
    this.status,
    this.totalPay,
    this.adminPay,
    this.vendorPay,
    this.refund,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Transection.fromJson(Map<String, dynamic> json) => Transection(
        id: json["_id"],
        paymentId: json["paymentId"],
        parkingId: json["ParkingId"],
        vendorId: json["vendorId"],
        userId: json["userId"],
        status: json["status"],
        totalPay: json["totalPay"],
        adminPay: json["adminPay"]?.toDouble(),
        vendorPay: json["vendorPay"]?.toDouble(),
        refund: json["refund"],
        type: json["type"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "paymentId": paymentId,
        "ParkingId": parkingId,
        "vendorId": vendorId,
        "userId": userId,
        "status": status,
        "totalPay": totalPay,
        "adminPay": adminPay,
        "vendorPay": vendorPay,
        "refund": refund,
        "type": type,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}
