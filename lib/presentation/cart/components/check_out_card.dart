import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/orders/order_controller.dart';
import 'package:pasal/presentation/esewa/esewa_page.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/widgets/default_button.dart';

import '../cart_controller.dart';

class CheckoutCard extends StatelessWidget {
  final CartController cartController;

  CheckoutCard({
    Key? key,
    required this.cartController,
  }) : super(key: key);
  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                const Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: ColorManager.kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        cartController.state == ViewState.busy
                            ? const TextSpan(text: "loading..")
                            : TextSpan(
                                text: cartController.cartResponse![0] == null
                                    ? "0"
                                    : "${cartController.cartResponse![0].bill}\$",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {
                      Get.to(() => const EsewaEpay());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void placeAllOrders() {
  //   for (int i = 0; i < cartController.cartResponse!.length; i++) {
  //     Map map = {
  //       "productId": cartController.cartResponse![0].items[i].itemId,
  //       "quantity": cartController.cartResponse![0].items[i].quantity
  //     };
  //     orderController.orderProduct(map);
  //   }
  // }
}
