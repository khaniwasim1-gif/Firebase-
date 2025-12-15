// To parse this JSON data, do
//
//     final modelClass = modelClassFromJson(jsonString);

import 'dart:convert';


class ModelClass {
  String? docId;
  String? name;
  String? createAt;

  ModelClass({
    this.docId,
    this.name,
    this.createAt,
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
    docId: json["docId"],
    name: json["name"],
    createAt: json["createAt"],
  );

  Map<String, dynamic> toJson(String priorityID) => {
    "docId": priorityID,
    "name": name,
    "createAt": createAt,
  };
}
