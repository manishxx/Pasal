import 'package:flutter/material.dart';
import 'package:pasal/presentation/sign_up/components/complete_profile/complete_profile_form.dart';

import '../../../resources/size_config.dart';
import '../../../resources/strings_manager.dart';

class CompleteProfileBody extends StatelessWidget {
  const CompleteProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            AppStrings.completeProfile,
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          AppStrings.signUpPageText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: getProportionateScreenWidth(10),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        const CompleteProfileForm(),
        SizedBox(height: SizeConfig.screenHeight * 0.0000001),
        Text(
          AppStrings.termsAndConditions,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: getProportionateScreenWidth(10),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
