import 'package:flutter/material.dart';

import 'package:pasal/models/orders.dart';
import 'package:pasal/presentation/orders/order_controller.dart';

import '../../app/constants/enums.dart';

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
        return orderController!.state == ViewState.busy
            ? const Center(child: CircularProgressIndicator())
            : ListTile(
                title:
                    Text(orderController!.orderResponse![0].orders[index].id),
                subtitle: Text(orderController!
                    .orderResponse![0].orders[index].quantity
                    .toString()),
                leading: const Icon(Icons.fire_truck_rounded),
              );
      },
    );
  }
}
