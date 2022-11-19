import 'package:flutter/material.dart';
import 'package:pasal/models/products.dart';

import 'body.dart';
import 'custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final Product? product;
  const DetailsScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: product!.rating),
      ),
      body: Body(product: product!),
    );
  }
}
