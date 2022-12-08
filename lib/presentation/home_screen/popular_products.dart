import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/models/products.dart';
import 'package:pasal/presentation/widgets/product_card.dart';
import 'package:pasal/presentation/product/product_controller.dart';

import '../resources/size_config.dart';

class PopularProducts extends StatelessWidget {
  PopularProducts({super.key});

  @override
  final ProductListController controller = Get.put(ProductListController());
  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: Obx(
              () => (ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.productResponse.length,
                  itemBuilder: (context, index) {
                    if (demoProducts[index].isPopular) {
                      return ProductCard(
                          product: controller.productResponse[index]);
                    }
                    return const SizedBox.shrink();
                  })),
            ),
          ),
        ),
      ],
    );
  }
}
