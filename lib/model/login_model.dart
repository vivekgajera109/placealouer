// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

LoginModel loginModelFromMap(String str) =>
    LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  final bool? success;
  final String? message;
  final LoginData? data;
  final Error? error;

  LoginModel({
    this.success,
    this.message,
    this.data,
    this.error,
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : LoginData.fromMap(json["data"]),
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
        "error": error?.toMap(),
      };
}

class LoginData {
  final User? user;
  final String? token;

  LoginData({
    this.user,
    this.token,
  });

  factory LoginData.fromMap(Map<String, dynamic> json) => LoginData(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
      };
}

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final int? role;
  final bool? forgotOtpVerify;
  final bool? isdelete;
  final bool? isverify;
  final int? loginType;
  final dynamic facebookId;
  final dynamic appleAuthCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? signupOtpExpire;
  final List<String>? uploadedIdentity;
  final dynamic profileImg;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.forgotOtpVerify,
    this.isdelete,
    this.isverify,
    this.loginType,
    this.facebookId,
    this.appleAuthCode,
    this.createdAt,
    this.updatedAt,
    this.signupOtpExpire,
    this.uploadedIdentity,
    this.profileImg,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        forgotOtpVerify: json["forgotOtpVerify"],
        isdelete: json["isdelete"],
        isverify: json["isverify"],
        loginType: json["loginType"],
        facebookId: json["facebookId"],
        appleAuthCode: json["appleAuthCode"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        signupOtpExpire: json["signupOtpExpire"] == null
            ? null
            : DateTime.parse(json["signupOtpExpire"]),
        uploadedIdentity: json["uploadedIdentity"] == null
            ? []
            : List<String>.from(json["uploadedIdentity"]!.map((x) => x)),
        profileImg: json["profile_img"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "role": role,
        "forgotOtpVerify": forgotOtpVerify,
        "isdelete": isdelete,
        "isverify": isverify,
        "loginType": loginType,
        "facebookId": facebookId,
        "appleAuthCode": appleAuthCode,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "signupOtpExpire": signupOtpExpire?.toIso8601String(),
        "uploadedIdentity": uploadedIdentity == null
            ? []
            : List<dynamic>.from(uploadedIdentity!.map((x) => x)),
        "profile_img": profileImg,
      };
}

class Error {
  Error();

  factory Error.fromMap(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toMap() => {};
}
