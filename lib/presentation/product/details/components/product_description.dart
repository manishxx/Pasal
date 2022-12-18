import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/models/api_products.dart';
import 'package:pasal/presentation/cart/cart_controller.dart';

import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/widgets/product_counter.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription(
      {Key? key, required this.product, this.pressOnSeeMore})
      : super(key: key);
  final Products product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    bool isFavourite = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.product.title.toUpperCase(),
                style: Theme.of(context).textTheme.headline6,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Obx(
                      () => Text(
                        "Quantity:" + cartController.count.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                          width: getProportionateScreenWidth(40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.kPrimaryColor),
                            onPressed: cartController.decrement,
                            child: Center(child: Icon(Icons.remove)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                          width: getProportionateScreenWidth(40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.kPrimaryColor),
                            onPressed: cartController.increment,
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color:
                  isFavourite ? const Color(0xffbbbb) : const Color(0xfff5f6f9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenHeight(64),
          ),
          child: Text(
            widget.product.desc,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20), vertical: 10),
          child: GestureDetector(
            onTap: () {},
            child: Row(children: [
              Text(
                "See More Detail",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorManager.kPrimaryColor),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: ColorManager.kPrimaryColor,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
