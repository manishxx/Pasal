import 'package:flutter/material.dart';

import 'package:pasal/presentation/resources/assets_manager.dart';

import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/profile_page/profile_menu.dart';

import '../resources/routes_manager.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(
              ImageAssets.profileImage,
            )),
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        ),
        const ProfileMenu(
          text: "Edit Account",
          icon: "assets/icons/User Icon.svg",
          // press: () => {Navigator.pushNamed(context, Routes.profileView)},
        ),
        const ProfileMenu(
          text: "History",
          icon: "assets/icons/Bell.svg",
          // press: () => {Navigator.pushNamed(context, Routes.history)},
        ),
        ProfileMenu(
          text: "Settings",
          icon: "assets/icons/Settings.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Help Center",
          icon: "assets/icons/Question mark.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Log Out",
          icon: "assets/icons/Log out.svg",
          press: () async {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.signInRoute, (route) => false);
          },
        ),
      ],
    );
  }
}
