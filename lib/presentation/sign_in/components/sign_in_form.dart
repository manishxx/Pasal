import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/app/constants/app_constants.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/color_manager.dart';

import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:pasal/presentation/widgets/default_button.dart';

import '../../helper/keyboard_util.dart';
import '../../widgets/custom_suffix_icon.dart';
import '../../widgets/form_error.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInController.formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: _signInController.remember!.value,
                  activeColor: ColorManager.kPrimaryColor,
                  onChanged: (value) {
                    _signInController.changeRememberValue(value!);
                  },
                ),
              ),
              const Text(AppStrings.rememberMe),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  //  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: const Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: _signInController.errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Obx(
            () => _signInController.state == ViewState.busy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : DefaultButton(
                    text: AppStrings.continueText,
                    press: () {
                      if (_signInController.formKey.currentState!.validate()) {
                        _signInController.formKey.currentState!.save();
                        // if all are valid then go to success screen
                        KeyboardUtil.hideKeyboard(context);
                        _signInController.mapInputsLogin();
                      }
                    },
                  ),
          )
        ],
      ),
    );
  }

  Obx buildPasswordFormField() {
    return Obx(() => TextFormField(
        obscureText: _signInController.isObscureText.value,
        onSaved: (newValue) => _signInController.password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            _signInController.removeError(error: AppStrings.kPassNullError);
          } else if (value.length >= 6) {
            _signInController.removeError(error: AppStrings.kShortPassError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
            _signInController.addError(error: AppStrings.kPassNullError);
            return "";
          } else if (value.length < 6) {
            _signInController.addError(error: AppStrings.kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: AppStrings.password,
            hintText: AppStrings.enterPassword,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: InkWell(
                onTap: (() {
                  _signInController.isObscureText.value =
                      !_signInController.isObscureText.value;
                }),
                child: Icon(_signInController.isObscureText.value
                    ? Icons.visibility
                    : Icons.visibility_off)))));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => _signInController.name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _signInController.removeError(error: AppStrings.kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          _signInController.removeError(error: AppStrings.kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          _signInController.addError(error: AppStrings.kEmailNullError);
          return AppStrings.emptyString;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.email,
        hintText: AppStrings.enterEmail,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: ImageAssets.emailIcon),
      ),
    );
  }
}
