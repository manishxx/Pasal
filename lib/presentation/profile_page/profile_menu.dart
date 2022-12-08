import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/color_manager.dart';
import '../resources/size_config.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.095,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: ColorManager.kTextColor,
            padding: const EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: ColorManager.kPrimaryColor,
          ),
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: ColorManager.kTextColor,
                width: 22,
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
              )),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
