// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  String status;
  int code;
  List<Datum> data;

  LocationModel({
    required this.status,
    required this.code,
    required this.data,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    status: json["status"],
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String lat;
  String long;
  String name;
  String address;
  int userId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  Datum({
    required this.id,
    required this.lat,
    required this.long,
    required this.name,
    required this.address,
    required this.userId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    lat: json["lat"],
    long: json["long"],
    name: json["name"],
    address: json["address"],
    userId: json["userId"],
    deletedAt: json["deletedAt"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    user: User.fromJson(json["User"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lat": lat,
    "long": long,
    "name": name,
    "address": address,
    "userId": userId,
    "deletedAt": deletedAt,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "User": user.toJson(),
  };
}

class User {
  String username;

  User({
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
  };
}
