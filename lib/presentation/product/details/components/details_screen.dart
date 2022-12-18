import 'package:flutter/material.dart';
import 'package:pasal/models/api_products.dart';

import '../../../../models/orders.dart';
import 'body.dart';
import 'custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final Products product;

  const DetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: double.parse(product.price)),
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
