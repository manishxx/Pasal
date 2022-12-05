import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:pasal/models/democart.dart';
import 'package:pasal/presentation/resources/size_config.dart';

import 'cart_card.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoCarts[index].product.id.toString()),
                  onDismissed: (direction) => {
                    setState(() {
                      demoCarts.removeAt(index);
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
                  child: CartCard(cart: demoCarts[index]),
                ),
              )),
    );
  }
}
