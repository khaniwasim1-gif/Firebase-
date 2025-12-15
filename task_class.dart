import 'dart:convert';

class PriorityModel {
  final String? docId;
  final String? title;
  final String? description;
  final bool? isCompleted;
  final int? createdAt;
  final String? priorityID;

  PriorityModel({
    this.docId,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.priorityID
  });

  factory PriorityModel.fromJson(Map<String, dynamic> json) => PriorityModel(
    docId: json["docID"],
    title: json["title"],
    description: json["description"],
    priorityID: json["priorityID"],
    isCompleted: json["isCompleted"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson(String taskID) => {
    "docID": taskID,
    "title": title,
    "description": description,
    "isCompleted": isCompleted,
    "priorityID": priorityID,
    "createdAt": createdAt,
  };
}