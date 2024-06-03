// To parse this JSON data, do
//
//     final getBookedParkingsModel = getBookedParkingsModelFromJson(jsonString);

import 'dart:convert';

GetBookedParkingsModel getBookedParkingsModelFromJson(String str) =>
    GetBookedParkingsModel.fromJson(json.decode(str));

String getBookedParkingsModelToJson(GetBookedParkingsModel data) =>
    json.encode(data.toJson());

class GetBookedParkingsModel {
  final bool? success;
  final String? message;
  final GetBookedParkingsData? data;
  final Error? error;

  GetBookedParkingsModel({
    this.success,
    this.message,
    this.data,
    this.error,
  });

  factory GetBookedParkingsModel.fromJson(Map<String, dynamic> json) =>
      GetBookedParkingsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : GetBookedParkingsData.fromJson(json["data"]),
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "error": error?.toJson(),
      };
}

class GetBookedParkingsData {
  final int? totalPage;
  final int? totalparking;
  final int? page;
  final int? limit;
  final List<Parking>? parking;

  GetBookedParkingsData({
    this.totalPage,
    this.totalparking,
    this.page,
    this.limit,
    this.parking,
  });

  factory GetBookedParkingsData.fromJson(Map<String, dynamic> json) =>
      GetBookedParkingsData(
        totalPage: json["totalPage"],
        totalparking: json["totalparking"],
        page: json["page"],
        limit: json["limit"],
        parking: json["parking"] == null
            ? []
            : List<Parking>.from(
                json["parking"]!.map((x) => Parking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPage": totalPage,
        "totalparking": totalparking,
        "page": page,
        "limit": limit,
        "parking": parking == null
            ? []
            : List<dynamic>.from(parking!.map((x) => x.toJson())),
      };
}

class Parking {
  final String? id;
  final String? parkingId;
  final String? userId;
  final String? vendorId;
  final bool? isdelete;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? vehicleType;
  final String? vehicleName;
  final String? vehicleNumber;
  final int? payment;
  final int? rating;
  final dynamic review;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ParkingDetails? parkingDetails;
  final Vendor? vendor;

  Parking({
    this.id,
    this.parkingId,
    this.userId,
    this.vendorId,
    this.isdelete,
    this.startTime,
    this.endTime,
    this.vehicleType,
    this.vehicleName,
    this.vehicleNumber,
    this.payment,
    this.rating,
    this.review,
    this.createdAt,
    this.updatedAt,
    this.parkingDetails,
    this.vendor,
  });

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        id: json["_id"],
        parkingId: json["parkingId"],
        userId: json["userId"],
        vendorId: json["vendorId"],
        isdelete: json["isdelete"],
        startTime: json["startTime"] == null
            ? null
            : DateTime.parse(json["startTime"]),
        endTime:
            json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        vehicleType: json["vehicleType"],
        vehicleName: json["vehicleName"],
        vehicleNumber: json["vehicleNumber"],
        payment: json["payment"],
        rating: json["rating"],
        review: json["review"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        parkingDetails: json["parkingDetails"] == null
            ? null
            : ParkingDetails.fromJson(json["parkingDetails"]),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parkingId": parkingId,
        "userId": userId,
        "vendorId": vendorId,
        "isdelete": isdelete,
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime?.toIso8601String(),
        "vehicleType": vehicleType,
        "vehicleName": vehicleName,
        "vendor": vendor,
        "vehicleNumber": vehicleNumber,
        "payment": payment,
        "rating": rating,
        "review": review,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "parkingDetails": parkingDetails?.toJson(),
      };
}

class ParkingDetails {
  final String? id;
  final String? parkingName;
  final String? latitude;
  final String? longitude;
  final List<String>? parkingImg;
  final Address? address;

  ParkingDetails({
    this.id,
    this.latitude,
    this.parkingName,
    this.longitude,
    this.parkingImg,
    this.address,
  });

  factory ParkingDetails.fromJson(Map<String, dynamic> json) => ParkingDetails(
        id: json["_id"]!,
        parkingName: json["parkingName"]!,
        latitude: json["latitude"],
        longitude: json["longitude"],
        parkingImg: json["parkingImg"] == null
            ? []
            : List<String>.from(json["parkingImg"]!.map((x) => x)),
        address:
            json["Address"] == null ? null : Address.fromJson(json["Address"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parkingName": parkingName,
        "latitude": latitude,
        "longitude": longitude,
        "parkingImg": parkingImg == null
            ? []
            : List<dynamic>.from(parkingImg!.map((x) => x)),
        "Address": address?.toJson(),
      };
}

class Address {
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final int? zip;

  Address({
    this.address,
    this.city,
    this.state,
    this.country,
    this.zip,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zip: json["zip"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zip": zip,
      };
}

class Vendor {
  final String? id;
  final double? avgRating;

  Vendor({
    this.id,
    this.avgRating,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["_id"],
        avgRating: json["avgRating"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "avgRating": avgRating,
      };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
