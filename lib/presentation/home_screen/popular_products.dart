import 'package:flutter/material.dart';
import 'package:pasal/models/products.dart';
import 'package:pasal/presentation/widgets/product_card.dart';
import '../resources/size_config.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Popular Products',
                style: TextStyle(fontSize: 26),
              ),
              Text(
                'See More',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
            child: SizedBox(
                height: getProportionateScreenHeight(300),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: demoProducts.length,
                    itemBuilder: (context, index) {
                      if (demoProducts[index].isPopular) {
                        return ProductCard(product: demoProducts[index]);
                      }
                      return const SizedBox.shrink();
                    })))
      ],
    ));
  }
}
