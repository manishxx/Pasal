import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/size_config.dart';
import '../../../resources/strings_manager.dart';
import '../../../widgets/custom_suffix_icon.dart';
import '../../../widgets/default_button.dart';

class CompleteProfileForm extends StatelessWidget {
  const CompleteProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  label: const Text(AppStrings.firstName),
                  labelStyle: TextStyle(
                      color: ColorManager.grey1, fontWeight: FontWeight.w600),
                  hintText: AppStrings.firstNameTextField,
                  suffixIcon:
                      const CustomSurffixIcon(svgIcon: ImageAssets.userIcon)),
              cursorColor: ColorManager.grey1,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            TextFormField(
              decoration: InputDecoration(
                  label: const Text(AppStrings.lastName),
                  labelStyle: TextStyle(
                      color: ColorManager.grey1, fontWeight: FontWeight.w600),
                  hintText: AppStrings.lastNameTextField,
                  suffixIcon:
                      const CustomSurffixIcon(svgIcon: ImageAssets.userIcon)),
              cursorColor: ColorManager.grey1,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            TextFormField(
              decoration: InputDecoration(
                  label: const Text(AppStrings.phoneNumber),
                  labelStyle: TextStyle(
                      color: ColorManager.grey1, fontWeight: FontWeight.w600),
                  hintText: AppStrings.phoneNumberTextField,
                  suffixIcon:
                      const CustomSurffixIcon(svgIcon: ImageAssets.phone)),
              cursorColor: ColorManager.grey1,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            TextFormField(
              decoration: InputDecoration(
                  label: const Text(AppStrings.address),
                  labelStyle: TextStyle(
                      color: ColorManager.grey1, fontWeight: FontWeight.w600),
                  hintText: AppStrings.addressTextField,
                  suffixIcon: const CustomSurffixIcon(
                      svgIcon: ImageAssets.locationPointIcon)),
              cursorColor: ColorManager.grey1,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            DefaultButton(
              text: AppStrings.continueText,
              press: () {
                Navigator.pushReplacementNamed(context, Routes.signInRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
