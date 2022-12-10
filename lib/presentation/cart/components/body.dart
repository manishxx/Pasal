import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/presentation/cart/cart_controller.dart';
import 'package:pasal/presentation/resources/size_config.dart';

import 'cart_card.dart';

class CartBody extends StatefulWidget {
  final CartController cartController;

  const CartBody({super.key, required this.cartController});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Obx(() {
        return widget.cartController.state == ViewState.busy
            ? const CircularProgressIndicator()
            : widget.cartController.cartResponse == null
                ? const Text("")
                : ListView.builder(
                    itemCount:
                        widget.cartController.cartResponse![0].items.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Dismissible(
                            key: Key(widget
                                .cartController.cartResponse![0].items[index].id
                                .toString()),
                            onDismissed: (direction) => {
                              setState(() {
                                widget.cartController.deleteCart(widget
                                    .cartController
                                    .cartResponse![0]
                                    .items[index]
                                    .itemId);
                                widget.cartController.cartResponse![0].items
                                    .removeAt(index);
                              }),
                            },
                            background: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                item: widget.cartController.cartResponse![0]
                                    .items[index]),
                          ),
                        ));
      }),
    );
  }
}
