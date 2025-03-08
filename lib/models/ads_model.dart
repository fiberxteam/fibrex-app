import 'dart:convert';

import '../config/interceptor/dio_interceptor.dart';
class AdsModel {
  int? id;
  String? image;
  String? link;
  bool? active;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String? username;

  // Define the base URL dynamically by getting the IP from DioHttp
  String baseUrl = DioHttp.getIpAddress();  // Use DioHttp class to get the IP address

  AdsModel({
    this.id,
    this.image,
    this.link,
    this.active,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.username,
  });

  // From JSON to Dart model
  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
    id: json["id"],
    image: json["image"], // Store the relative image path
    link: json["link"],
    active: json["active"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"] != null
        ? DateTime.parse(json["deletedAt"])
        : null,
    username: json["User"] != null ? json["User"]["username"] : null,
  );

  // From Dart model to JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "link": link,
    "active": active,
    "userId": userId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
    "User": {"username": username},
  };

  // Get the full image URL by combining the base URL with the image path
  String getFullImageUrl() {
    if (image != null && image!.isNotEmpty) {
      return '$baseUrl/$image'; // Combine the base URL with the image path from API
    } else {
      return '$baseUrl/default-image.png'; // Return a default image if no image is provided
    }
  }
}

List<AdsModel> adsModelFromJson(String str) =>
    List<AdsModel>.from(json.decode(str)['data'].map((x) => AdsModel.fromJson(x)));

String adsModelToJson(List<AdsModel> data) =>
    json.encode({
      'status': 'success',
      'code': 200,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    });

