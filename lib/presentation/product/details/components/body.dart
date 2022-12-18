import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/orders/order_controller.dart';
import 'package:pasal/presentation/cart/cart_controller.dart';
import 'package:pasal/presentation/esewa/esewa_page.dart';

import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/widgets/default_button.dart';
import 'package:pasal/presentation/widgets/product_counter.dart';

import '../../../../models/api_products.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

//Product detalis (Body)
class Body extends StatefulWidget {
  final Products product;
  // final Orders orders;
  // final Order order;

  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final CartController cartController = Get.put(CartController());
  final ProductCounter productCounter = Get.put(ProductCounter());

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    //ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                DefaultButton(
                                  text: "Add To Cart",
                                  press: () {
                                    log("product id ${widget.product.id}");
                                    Map map = {
                                      "itemId": widget.product.id,
                                      "quantity":
                                          cartController.count.toString()
                                    };
                                    cartController.addToCart(map);
                                  },
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(20),
                                ),
                                DefaultButton(
                                  text: "Order Now",
                                  press: () async {
                                    log("ORDER.PRODUCT VALUE ${widget.product}");
                                    Map map = {
                                      "productId": widget.product.id,
                                      "quantity":
                                          cartController.count.toString(),
                                    };
                                    log(map.toString());
                                    bool success =
                                        await orderController.orderProduct(map);
                                    if (success) {
                                      showMyDialog();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Payment method'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Choose any one payment method.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cash on delivery'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Esewa'),
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(() => const EsewaEpay());
              },
            ),
          ],
        );
      },
    );
  }
}
