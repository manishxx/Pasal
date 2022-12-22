import 'package:flutter/material.dart';
import 'package:pasal/models/api_products.dart';

import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/duration_constants.dart';
import 'package:pasal/presentation/resources/size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({Key? key, required this.product}) : super(key: key);
  final Products product;

  @override
  State<ProductImages> get createState => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: Image.network(widget.product.img),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(1, (index) => buildSmallProductPreview(index)),
            ],
          ),
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManager.kPrimaryColor
                .withOpacity(selectedImage == index ? 1 : 0),
          ),
        ),
        child: Image.network(widget.product.img),
      ),
    );
  }
}
