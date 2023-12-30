// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

List<MenuModel> menuModelFromJson(String str) =>
    List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
  MenuModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.total,
  });

  int id;
  String name;
  int price;
  String image;
  int quantity;
  double total;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        quantity: json["quantity"],
        total:json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "quantity": quantity,
        "total" : total,
      };
}
