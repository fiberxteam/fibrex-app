import 'dart:convert';

import '../config/interceptor/dio_interceptor.dart';

// Define the model for Plans
List<PlansModel> plansModelFromJson(String str) =>
    List<PlansModel>.from(json.decode(str).map((x) => PlansModel.fromJson(x)));

// Define the function to convert Plan object to JSON
String plansModelToJson(List<PlansModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlansModel {
  String? id;
  String? name;
  dynamic price;
  String? description;
  String? imageUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? username;
  String baseUrl = DioHttp.getIpAddress();  // Use DioHttp class to get the IP address

  PlansModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.username,
  });

  // Factory method to parse a JSON object into a PlanModel
  factory PlansModel.fromJson(Map<String, dynamic> json) => PlansModel(
    id: json["id"].toString(),
    name: json["name"],
    price: json["price"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    username: json["User"] != null ? json["User"]["username"] : null, // Extracting username from the nested User object
  );

  // Convert PlanModel instance into a JSON object
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "imageUrl": imageUrl,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "User": {
      "username": username,  // Include username in the JSON response
    }
  };
  String getFullImageUrl() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return '$baseUrl/$imageUrl'; // Combine the base URL with the image path from API
    } else {
      return '$baseUrl/default-image.png'; // Return a default image if no image is provided
    }
  }
}
