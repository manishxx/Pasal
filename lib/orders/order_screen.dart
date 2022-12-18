import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/orders/order_body.dart';
import 'package:pasal/orders/order_controller.dart';
import 'package:pasal/presentation/cart/components/check_out_card.dart';

import 'package:pasal/presentation/product/details/components/custom_app_bar.dart';

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
