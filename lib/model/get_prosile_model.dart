// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  final bool? success;
  final String? message;
  final GetProfileData? data;
  final Error? error;

  GetProfileModel({
    this.success,
    this.message,
    this.data,
    this.error,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : GetProfileData.fromJson(json["data"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "error": error?.toJson(),
      };
}

class GetProfileData {
  final ProfileUser? user;

  GetProfileData({
    this.user,
  });

  factory GetProfileData.fromJson(Map<String, dynamic> json) => GetProfileData(
        user: json["user"] == null ? null : ProfileUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class ProfileUser {
  final List<dynamic>? uploadedIdentity;
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
  final dynamic profileImg;

  ProfileUser({
    this.uploadedIdentity,
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
    this.profileImg,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) => ProfileUser(
        uploadedIdentity: json["uploadedIdentity"] == null
            ? []
            : List<dynamic>.from(json["uploadedIdentity"]!.map((x) => x)),
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
        profileImg: json["profile_img"],
      );

  Map<String, dynamic> toJson() => {
        "uploadedIdentity": uploadedIdentity == null
            ? []
            : List<dynamic>.from(uploadedIdentity!.map((x) => x)),
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
        "profile_img": profileImg,
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}
