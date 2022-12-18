class Orders {
  Orders({
    required this.count,
    required this.orders,
  });

  int count;
  List<Order> orders;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        count: json["count"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.id,
    required this.product,
    required this.quantity,
    required this.request,
  });

  String id;
  String product;
  int quantity;
  Request request;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        product: json["product"],
        quantity: json["quantity"],
        request: Request.fromJson(json["request"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product,
        "quantity": quantity,
        "request": request.toJson(),
      };
}

class Request {
  Request({
    required this.type,
    required this.url,
  });

  String type;
  String url;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}
