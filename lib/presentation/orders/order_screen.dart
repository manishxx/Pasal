import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/orders/order_body.dart';
import 'package:pasal/presentation/orders/order_controller.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: OrderBody(
        orderController: orderController,
      ),
    );
  }
}
