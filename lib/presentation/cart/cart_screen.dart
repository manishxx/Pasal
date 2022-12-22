import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/cart/cart_controller.dart';
import 'package:pasal/presentation/cart/components/body.dart';

import 'package:pasal/presentation/resources/strings_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/size_config.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> get createState => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController controller = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    controller.fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartBody(
        cartController: controller,
      ),
      bottomNavigationBar: CheckoutCard(
        cartController: controller,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: MaterialButton(
        child: SizedBox(
          height: getProportionateScreenWidth(40),
          width: getProportionateScreenWidth(40),
          child: Padding(
            padding: const EdgeInsets.all(0.5),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: ColorManager.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero),
              onPressed: () => Navigator.pop(context),
              child: SvgPicture.asset(
                ImageAssets.backIcon,
                height: 15,
              ),
            ),
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          AppStrings.yourCart,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
