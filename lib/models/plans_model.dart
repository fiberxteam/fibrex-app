// To parse this JSON data, do
//
//     final plansModel = plansModelFromJson(jsonString);

import 'dart:convert';

List<PlansModel> plansModelFromJson(String str) =>
    List<PlansModel>.from(json.decode(str).map((x) => PlansModel.fromJson(x)));

String plansModelToJson(List<PlansModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlansModel {
  String? id;
  bool? deleted;
  DateTime? creationDate;
  String? name;
  int? price;
  String? description;

  PlansModel({
    this.id,
    this.deleted,
    this.creationDate,
    this.name,
    this.price,
    this.description,
  });

  factory PlansModel.fromJson(Map<String, dynamic> json) => PlansModel(
        id: json["id"],
        deleted: json["deleted"],
        creationDate: DateTime.parse(json["creationDate"]),
        name: json["name"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deleted": deleted,
        "creationDate": creationDate?.toIso8601String(),
        "name": name,
        "price": price,
        "description": description,
      };
}
