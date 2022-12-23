import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pasal/presentation/home_screen/home_features.dart';
import 'package:pasal/presentation/home_screen/popular_products.dart';
import 'package:pasal/presentation/home_screen/special_for_you.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/widgets/banner.dart';
import 'package:pasal/presentation/widgets/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> get createState => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white38,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(220),
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
                  icon: SvgPicture.asset(
                    ImageAssets.shopIcon,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    ImageAssets.bellIcon,
                  )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const BannerScreen(),
          const SizedBox(
            height: 12,
          ),
          const HomeFeatures(),
          const SpecialForYou(),
          PopularProducts(),
        ]),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
