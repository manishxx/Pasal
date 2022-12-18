import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import '../resources/size_config.dart';

class SpecialForYou extends StatelessWidget {
  const SpecialForYou({super.key});

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
                AppStrings.specialForYou,
                style: TextStyle(fontSize: 26),
              ),
              InkWell(
                child: Text(
                  AppStrings.seeMoreText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: SingleChildScrollView(
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
                        top: getProportionateScreenHeight(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            ImageAssets.imageBanner2,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Column(
                          children: const [
                            Text(
                              'Smartphone',
                              style: TextStyle(
                                fontFamily: 'Muli',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '18 Brands',
                              style: TextStyle(
                                fontFamily: 'Muli',
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            ImageAssets.imageBanner3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 120,
                        bottom: 20,
                        child: Text(
                          'Smartphone',
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
          ),
        )
      ],
    );
  }
}
