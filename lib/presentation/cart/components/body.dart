import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/cart/cart_controller.dart';
import 'package:pasal/presentation/resources/size_config.dart';

import 'cart_card.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Obx(() => ListView.builder(
          itemCount: cartController.cartResponse[0].items.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(cartController.cartResponse[0].items[index].id
                      .toString()),
                  onDismissed: (direction) => {
                    setState(() {
                      cartController.deleteCart(
                          cartController.cartResponse[0].items[index].id);
                      cartController.cartResponse[0].items.removeAt(index);
                    }),
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xffffe6e6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(
                      item: cartController.cartResponse[0].items[index]),
                ),
              ))),
    );
  }
}
