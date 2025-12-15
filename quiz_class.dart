// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';


class QuizModel {
  final String? docId;
  final String? name;
  final int? createAt;
  final String? description;

  QuizModel({
    this.docId,
    this.name,
    this.createAt,
    this.description,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    docId: json["docId"],
    name: json["name"],
    createAt: json["createAt"],
    description: json["description"],
  );

  Map<String, dynamic> toJson(String quizID) => {
    "docId": quizID,
    "name": name,
    "createAt": createAt,
    "description": description,
  };
}