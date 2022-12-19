import 'package:flutter/material.dart';
import 'package:pasal/models/cart.dart';

import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0x00fff6f9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name.toUpperCase(),
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
                text: "\$${item.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorManager.kPrimaryColor),
                children: [
                  TextSpan(
                      text: " X ${item.quantity}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorManager.kPrimaryColor)),
                ]))
          ],
        )
      ],
    );
  }
}
