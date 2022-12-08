import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/cart/cart_controller.dart';
import 'package:pasal/presentation/cart/components/body.dart';

import 'package:pasal/presentation/resources/strings_manager.dart';

import '../../models/api_products.dart';
import 'details/components/body.dart';

import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  final CartController controller = Get.put(CartController());

  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const CartBody(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: MaterialButton(
        child: Text("Back"),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        AppStrings.yourCart,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
