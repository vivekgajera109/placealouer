// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool? success;
  final int? statusCode;
  final String? message;
  final String? errorDescription;
  final LoginData? data;
  final Error? error;

  LoginModel({
    this.success,
    this.message,
    this.errorDescription,
    this.statusCode,
    this.data,
    this.error,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        errorDescription: json["error_description"],
        data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error_description": errorDescription,
        "data": data?.toJson(),
        "error": error?.toJson(),
      };
}

class LoginData {
  final User? user;
  final String? token;

  LoginData({
    this.user,
    this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  final dynamic loginType;
  final dynamic facebookId;
  final dynamic appleAuthCode;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? emailPhone;
  final int? role;
  final bool? forgotOtpVerify;
  final bool? isdelete;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? forgotOtpExpire;

  User({
    this.loginType,
    this.facebookId,
    this.appleAuthCode,
    this.id,
    this.firstName,
    this.lastName,
    this.emailPhone,
    this.role,
    this.forgotOtpVerify,
    this.isdelete,
    this.createdAt,
    this.updatedAt,
    this.forgotOtpExpire,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        loginType: json["loginType"],
        facebookId: json["facebookId"],
        appleAuthCode: json["appleAuthCode"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        emailPhone: json["email_phone"],
        role: json["role"],
        forgotOtpVerify: json["forgotOtpVerify"],
        isdelete: json["isdelete"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        forgotOtpExpire: json["forgotOtpExpire"] == null
            ? null
            : DateTime.parse(json["forgotOtpExpire"]),
      );

  Map<String, dynamic> toJson() => {
        "loginType": loginType,
        "facebookId": facebookId,
        "appleAuthCode": appleAuthCode,
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email_phone": emailPhone,
        "role": role,
        "forgotOtpVerify": forgotOtpVerify,
        "isdelete": isdelete,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "forgotOtpExpire": forgotOtpExpire?.toIso8601String(),
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}
