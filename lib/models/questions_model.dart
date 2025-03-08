// To parse this JSON data, do
//
//     final questionsModel = questionsModelFromJson(jsonString);

import 'dart:convert';

QuestionsModel questionsModelFromJson(String str) => QuestionsModel.fromJson(json.decode(str));

String questionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

class QuestionsModel {
  String status;
  int code;
  List<Datum> data;

  QuestionsModel({
    required this.status,
    required this.code,
    required this.data,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
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
  String question;
  String answer;
  bool isExpanded;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Datum({
    required this.id,
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
    isExpanded: json["isExpanded"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
    "isExpanded": isExpanded,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
