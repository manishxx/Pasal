import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:pasal/models/orders.dart';
import 'package:pasal/orders/order_controller.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key, this.orderController, this.order});
  final OrderController? orderController;
  final Order? order;

  @override
  Widget build(BuildContext context) {
    // log(orderController!.orderResponse![0].toString());
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: orderController!.orderResponse![0].count,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(orderController!.orderResponse![0].orders[index].id),
          subtitle: Text(orderController!
              .orderResponse![0].orders[index].quantity
              .toString()),
          leading: Icon(Icons.fire_truck_rounded),
        );
      },
    );
  }
}
