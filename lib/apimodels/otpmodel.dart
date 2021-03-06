import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    this.message,
  });

  String message;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        message: json["message"] as String,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
