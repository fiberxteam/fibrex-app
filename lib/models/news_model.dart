import 'dart:convert';

import '../config/interceptor/dio_interceptor.dart';

// This function will now only parse the "data" array, ignoring the "User" field
List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str)["data"].map((x) => NewsModel.fromJson(x)));

class NewsModel {
  int? id;
  String? title;
  String? content;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? image; // Add image field

  // Define the base URL dynamically by getting the IP from DioHttp
  String baseUrl = DioHttp.getIpAddress(); // Use DioHttp to get the IP

  NewsModel({
    this.id,
    this.title,
    this.content,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.image, // Add image parameter to constructor
  });

  // From JSON to Dart model
  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    image: json["image"], // Parse image field
  );

  // From Dart model to JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "userId": userId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
    "image": image, // Include image field in toJson
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
