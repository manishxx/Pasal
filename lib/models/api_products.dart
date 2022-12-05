import 'package:flutter/material.dart';

class Products {
  Products({
    required this.id,
    required this.title,
    required this.desc,
    required this.img,
    required this.categories,
    required this.size,
    required this.color,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String title;
  String desc;
  String img;
  List<String> categories;
  String size;
  String color;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["_id"],
        title: json["title"],
        desc: json["desc"],
        img: json["img"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        size: json["size"],
        color: json["color"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "desc": desc,
        "img": img,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "size": size,
        "color": color,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
