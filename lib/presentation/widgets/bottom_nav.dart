import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/home_screen/home_screen.dart';
import 'package:pasal/presentation/resources/color_manager.dart';

import '../profile_page/profile_screen.dart';
import '../resources/routes_manager.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    return BottomAppBar(
      color: ColorManager.kPrimaryColor,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: iconSize,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.fire_truck,
                color: Colors.white,
                size: iconSize,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.orderRoute);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: iconSize,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartRoute);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: iconSize,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.profileScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
