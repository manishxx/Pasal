import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/widgets/custom_suffix_icon.dart';
import 'package:pasal/presentation/widgets/default_button.dart';

import '../../resources/routes_manager.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.emailIcon,
                ),
                hintText: AppStrings.enterEmail,
                labelText: AppStrings.email),
          ),
          const SizedBox(
            height: 24,
          ),
          const TextField(
            decoration: InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.lockIcon,
                ),
                hintText: AppStrings.enterPassword,
                labelText: AppStrings.password),
          ),
          const SizedBox(
            height: 24,
          ),
          const TextField(
            decoration: InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.lockIcon,
                ),
                hintText: AppStrings.reEnterPassword,
                labelText: AppStrings.confirmPassword),
          ),
          const SizedBox(
            height: 40,
          ),
          DefaultButton(
              text: AppStrings.continueText,
              press: () {
                Navigator.pushReplacementNamed(
                    context, Routes.completeProfileRoute);
              }),
        ],
      ),
    );
  }
}
