import 'package:flutter/material.dart';
import 'package:pasal/models/api_products.dart';

import 'package:pasal/models/products.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription(
      {Key? key, required this.product, this.pressOnSeeMore})
      : super(key: key);
  final Products product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    bool isFavourite = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.title.toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
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
            product.desc,
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
