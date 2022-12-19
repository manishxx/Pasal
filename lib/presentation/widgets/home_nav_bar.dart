import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/size_config.dart';
import '../resources/strings_manager.dart';
import 'home_feature_icon.dart';

class HomeNavbar extends StatefulWidget {
  const HomeNavbar({super.key});

  @override
  State<HomeNavbar> createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            SizedBox(
              height: getProportionateScreenHeight(10),
              width: getProportionateScreenWidth(10),
              child: IconButton(
                  onPressed: () {},
                  icon: const HomeFeatureIcon(
                    svgIcon: ImageAssets.shopIcon,
                  )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
              width: getProportionateScreenWidth(10),
              child: IconButton(
                  onPressed: () {},
                  icon: const HomeFeatureIcon(
                    svgIcon: ImageAssets.bellIcon,
                  )),
            ),
          ],
        ));
  }
}
