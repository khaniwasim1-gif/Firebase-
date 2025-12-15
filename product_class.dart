// To parse this JSON data, do
//
//     final ProductModel = ProductModelFromJson(jsonString);

import 'dart:convert';


class ProductModel {
  final String? docId;
  final String? name;
   final int? createAt;
   final String? product;

  ProductModel({
    this.docId,
    this.name,
    this.createAt,
    this.product,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    docId: json["docId"],
    name: json["name"],
    createAt: json["createAt"],
    product: json["product"],
  );

  get isCompleted => null;

  Map<String, dynamic> toJson(String productID) => {
    "docId": productID,
    "name": name,
    "createAt": createAt,
    "product": product,
  };
}
