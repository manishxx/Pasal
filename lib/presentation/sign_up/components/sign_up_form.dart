import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/widgets/custom_suffix_icon.dart';
import 'package:pasal/presentation/widgets/default_button.dart';

import '../../../app/constants/enums.dart';
import '../../helper/keyboard_util.dart';
import '../sign_up_controller.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signupController.formKey,
      child: Column(
        children: [
          TextField(
            controller: _signupController.nameController,
            decoration: const InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.emailIcon,
                ),
                hintText: 'Enter Username',
                labelText: 'Username'),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            controller: _signupController.emailController,
            decoration: const InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.emailIcon,
                ),
                hintText: AppStrings.enterEmail,
                labelText: AppStrings.email),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            controller: _signupController.passwordController,
            decoration: const InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.lockIcon,
                ),
                hintText: AppStrings.enterPassword,
                labelText: AppStrings.password),
          ),
          const SizedBox(
            height: 40,
          ),
          Obx(
            () => _signupController.state == ViewState.busy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : DefaultButton(
                    text: AppStrings.continueText,
                    press: () {
                      if (_signupController.formKey.currentState!.validate()) {
                        _signupController.formKey.currentState!.save();
                        // if all are valid then go to success screen
                        KeyboardUtil.hideKeyboard(context);
                        _signupController.mapInputsRegister();
                      }
                    },
                  ),
          )
        ],
      ),
    );
  }
}
