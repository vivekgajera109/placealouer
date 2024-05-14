class GetParkingModel {
  final bool? success;
  final String? message;
  final ParkingData? data;
  final Error? error;

  GetParkingModel({
    this.success,
    this.message,
    this.data,
    this.error,
  });
}

class ParkingData {
  final int? totalPage;
  final int? totalparking;
  final int? page;
  final List<Parking>? parking;

  ParkingData({
    this.totalPage,
    this.totalparking,
    this.page,
    this.parking,
  });
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
  final bool? isdelete;
  final List<ParkingDetail>? parkingDetails;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? vendorId;
  final double? avgrating;
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
    this.isdelete,
    this.parkingDetails,
    this.createdAt,
    this.updatedAt,
    this.vendorId,
    this.avgrating,
    this.vendor,
  });
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
}

class ParkingDetail {
  final String? vehicleType;
  final int? pricePerHour;
  final int? pricePerDay;
  final int? slot;
  final String? id;

  ParkingDetail({
    this.vehicleType,
    this.pricePerHour,
    this.pricePerDay,
    this.slot,
    this.id,
  });
}

class Vendor {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final dynamic profileImg;

  Vendor({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profileImg,
  });
}

class Error {
  Error();
}
