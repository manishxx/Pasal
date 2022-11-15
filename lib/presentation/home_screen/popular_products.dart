import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
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
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: getProportionateScreenHeight(150),
                width: getProportionateScreenWidth(300),
                decoration: BoxDecoration(
                    color: ColorManager.bgWhite,
                    borderRadius: BorderRadius.circular(30)),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        ImageAssets.popularProduct1,
                      ),
                    ),
                    Positioned(
                      left: 120,
                      bottom: 20,
                      child: Text(
                        'Gaming',
                        style: TextStyle(
                          fontFamily: 'Muli',
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: getProportionateScreenHeight(150),
                width: getProportionateScreenWidth(300),
                decoration: BoxDecoration(
                    color: ColorManager.bgWhite,
                    borderRadius: BorderRadius.circular(30)),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        ImageAssets.popularProduct2,
                      ),
                    ),
                    Positioned(
                      left: 120,
                      bottom: 20,
                      child: Text(
                        'Men' 's Clothing',
                        style: TextStyle(
                          fontFamily: 'Muli',
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
