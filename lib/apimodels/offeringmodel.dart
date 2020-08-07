import 'dart:convert';

OfferingModel offeringModelFromJson(String str) => OfferingModel.fromJson(json.decode(str));

String offeringModelToJson(OfferingModel data) => json.encode(data.toJson());

class OfferingModel {
  OfferingModel({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory OfferingModel.fromJson(Map<String, dynamic> json) => OfferingModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.quantity,
    this.pickupLocation,
    this.price,
    this.productName,
    this.productOfferingId,
    this.userId,
  });

  String quantity;
  PickupLocation pickupLocation;
  String price;
  String productName;
  String productOfferingId;
  String userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    quantity: json["quantity"],
    pickupLocation: PickupLocation.fromJson(json["pickupLocation"]),
    price: json["price"],
    productName: json["productName"],
    productOfferingId: json["productOfferingId"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "pickupLocation": pickupLocation.toJson(),
    "price": price,
    "productName": productName,
    "productOfferingId": productOfferingId,
    "userId": userId,
  };
}

class PickupLocation {
  PickupLocation({
    this.long,
    this.lat,
  });

  int long;
  int lat;

  factory PickupLocation.fromJson(Map<String, dynamic> json) => PickupLocation(
    long: json["Long"] ,
    lat: json["Lat"],
  );

  Map<String, dynamic> toJson() => {
    "Long": long,
    "Lat": lat,
  };
}
