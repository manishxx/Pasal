// To parse this JSON data, do
//
//     final Cart = welcomeFromJson(jsonString);

class Cart {
  Cart({
    this.id,
    this.owner,
    this.items,
    this.bill,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? owner;
  List<Item>? items;
  int? bill;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        owner: json["owner"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        bill: json["bill"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "owner": owner,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "bill": bill,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class Item {
  Item({
    required this.itemId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.id,
  });

  String itemId;
  String name;
  int quantity;
  int price;
  String id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["itemId"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "name": name,
        "quantity": quantity,
        "price": price,
        "_id": id,
      };
}
