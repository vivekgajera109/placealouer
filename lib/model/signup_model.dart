// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final String? error_description;

  final Data? data;
  final Error? error;

  SignupModel({
    this.statusCode,
    this.success,
    this.message,
    this.error_description,
    this.data,
    this.error,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        error_description: json["error_description"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "error_description": error_description,
        "data": data?.toJson(),
        "error": error?.toJson(),
      };
}

class Data {
  final User? user;

  Data({
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  final String? firstName;
  final String? lastName;
  final String? emailPhone;
  final String? password;
  final int? role;
  final dynamic forgotOtp;
  final bool? forgotOtpVerify;
  final bool? isdelete;
  final int? loginType;
  final dynamic facebookId;
  final dynamic appleAuthCode;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.firstName,
    this.lastName,
    this.emailPhone,
    this.password,
    this.role,
    this.forgotOtp,
    this.forgotOtpVerify,
    this.isdelete,
    this.loginType,
    this.facebookId,
    this.appleAuthCode,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailPhone: json["email_phone"],
        password: json["password"],
        role: json["role"],
        forgotOtp: json["forgotOtp"],
        forgotOtpVerify: json["forgotOtpVerify"],
        isdelete: json["isdelete"],
        loginType: json["loginType"],
        facebookId: json["facebookId"],
        appleAuthCode: json["appleAuthCode"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email_phone": emailPhone,
        "password": password,
        "role": role,
        "forgotOtp": forgotOtp,
        "forgotOtpVerify": forgotOtpVerify,
        "isdelete": isdelete,
        "loginType": loginType,
        "facebookId": facebookId,
        "appleAuthCode": appleAuthCode,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}
