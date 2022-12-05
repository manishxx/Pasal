import 'package:flutter/material.dart';
import 'package:pasal/presentation/home_screen/api_products.dart';
import 'package:pasal/presentation/home_screen/home_features.dart';
import 'package:pasal/presentation/home_screen/popular_products.dart';
import 'package:pasal/presentation/home_screen/special_for_you.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/widgets/banner.dart';
import 'package:pasal/presentation/widgets/bottom_nav.dart';

import 'package:pasal/presentation/widgets/home_feature_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white38,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(250),
                child: TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: AppStrings.searchBarHintText,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const HomeFeatureIcon(
                    svgIcon: ImageAssets.shopIcon,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const HomeFeatureIcon(
                    svgIcon: ImageAssets.bellIcon,
                  )),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          BannerScreen(),
          SizedBox(
            height: 12,
          ),
          HomeFeatures(),
          SpecialForYou(),
          PopularProducts(),
        ]),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
