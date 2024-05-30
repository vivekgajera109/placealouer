// To parse this JSON data, do
//
//     final getParkingModel = getParkingModelFromJson(jsonString);

import 'dart:convert';

GetParkingModel getParkingModelFromJson(String str) =>
    GetParkingModel.fromJson(json.decode(str));

String getParkingModelToJson(GetParkingModel data) =>
    json.encode(data.toJson());

class GetParkingModel {
  final bool? success;
  final String? message;
  final GetParkingData? data;

  GetParkingModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetParkingModel.fromJson(Map<String, dynamic> json) =>
      GetParkingModel(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : GetParkingData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class GetParkingData {
  final int? totalPage;
  final int? totalparking;
  final int? page;
  final List<Parking>? parking;

  GetParkingData({
    this.totalPage,
    this.totalparking,
    this.page,
    this.parking,
  });

  factory GetParkingData.fromJson(Map<String, dynamic> json) => GetParkingData(
        totalPage: json["totalPage"],
        totalparking: json["totalparking"],
        page: json["page"],
        parking: json["parking"] == null
            ? []
            : List<Parking>.from(
                json["parking"]!.map((x) => Parking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPage": totalPage,
        "totalparking": totalparking,
        "page": page,
        "parking": parking == null
            ? []
            : List<dynamic>.from(parking!.map((x) => x.toJson())),
      };
}

class Parking {
  final String? id;
  final String? parkingName;
  final String? latitude;
  final String? longitude;
  final String? description;
  final List<String>? parkingImg;
  final Address? address;
  final int? status;
  final bool? isOpen;
  final bool? isdelete;
  final List<ParkingDetail>? parkingDetails;
  final double? avgrating;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? vendorId;
  final Vendor? vendor;

  Parking({
    this.id,
    this.parkingName,
    this.latitude,
    this.longitude,
    this.description,
    this.parkingImg,
    this.address,
    this.status,
    this.isOpen,
    this.isdelete,
    this.parkingDetails,
    this.avgrating,
    this.createdAt,
    this.updatedAt,
    this.vendorId,
    this.vendor,
  });

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        id: json["_id"],
        parkingName: json["parkingName"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        parkingImg: json["parkingImg"] == null
            ? []
            : List<String>.from(json["parkingImg"]!.map((x) => x)),
        address:
            json["Address"] == null ? null : Address.fromJson(json["Address"]),
        status: json["status"],
        isOpen: json["isOpen"],
        isdelete: json["isdelete"],
        parkingDetails: json["ParkingDetails"] == null
            ? []
            : List<ParkingDetail>.from(
                json["ParkingDetails"]!.map((x) => ParkingDetail.fromJson(x))),
        avgrating: json["avgrating"].toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        vendorId: json["vendorId"],
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parkingName": parkingName,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "parkingImg": parkingImg == null
            ? []
            : List<dynamic>.from(parkingImg!.map((x) => x)),
        "Address": address?.toJson(),
        "status": status,
        "isOpen": isOpen,
        "isdelete": isdelete,
        "ParkingDetails": parkingDetails == null
            ? []
            : List<dynamic>.from(parkingDetails!.map((x) => x.toJson())),
        "avgrating": avgrating,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "vendorId": vendorId,
        "vendor": vendor?.toJson(),
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

class ParkingDetail {
  final String? vehicleType;
  final int? pricePerHour;
  final int? slot;
  final String? id;
  final int? pricePerDay;

  ParkingDetail({
    this.vehicleType,
    this.pricePerHour,
    this.slot,
    this.id,
    this.pricePerDay,
  });

  factory ParkingDetail.fromJson(Map<String, dynamic> json) => ParkingDetail(
        vehicleType: json["vehicleType"],
        pricePerHour: json["pricePerHour"],
        slot: json["slot"],
        id: json["_id"],
        pricePerDay: json["pricePerDay"],
      );

  Map<String, dynamic> toJson() => {
        "vehicleType": vehicleType,
        "pricePerHour": pricePerHour,
        "slot": slot,
        "_id": id,
        "pricePerDay": pricePerDay,
      };
}

class Vendor {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? profileImg;

  Vendor({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profileImg,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        profileImg: json["profile_img"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "profile_img": profileImg,
      };
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
