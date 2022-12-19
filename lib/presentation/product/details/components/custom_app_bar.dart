import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;
  const CustomAppBar({super.key, required this.rating});
  Size get preferrerdSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(children: [
          SizedBox(
            height: getProportionateScreenWidth(40),
            width: getProportionateScreenWidth(40),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: ColorManager.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero),
              onPressed: () => Navigator.pop(context),
              child: SvgPicture.asset(
                ImageAssets.backIcon,
                height: 15,
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Text(
                  "$rating",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset("$iconPath/Star Icon.svg")
              ],
            ),
          )
        ]),
      ),
    );
  }
}
