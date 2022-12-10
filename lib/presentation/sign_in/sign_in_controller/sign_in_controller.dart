import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pasal/data/local/shared_preferences/shared_preference_manager.dart';
import 'package:pasal/data/network/api_auth_provider.dart';
import 'package:pasal/presentation/base_model/base_model.dart';

import '../../../app/constants/enums.dart';
import '../../../models/token.dart';
import '../../resources/routes_manager.dart';

class SignInController extends BaseController {
  final formKey = GlobalKey<FormState>();

  String? password;
  List errors = [].obs;
  var isObscureText = true.obs;
  var remember = false.obs;
  String? name;
  Token? token;
  final ApiAuthProvider apiAuthProvider = ApiAuthProvider();
  final SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  void addError({String? error}) {
    if (!errors.contains(error)) {
      errors.add(error);
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }

  void changeRememberValue(bool value) => remember.value = value;

  void mapInputsLogin() {
    Map map = {"username": name, "password": password};
    loginUser(map);
  }

  void loginUser(Map map) async {
    setState(ViewState.busy);
    token = await apiAuthProvider.login(map);

    if (token == null) {
      Fluttertoast.showToast(
          msg: "Check your credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.blue[300],
          textColor: Colors.white,
          fontSize: 16.0);
      setState(ViewState.retrieved);
    } else {
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.keyAccessToken, token!.accessToken!);
      log("access token ${token!.accessToken}");

      await sharedPreferencesManager.putBool(
          SharedPreferencesManager.keyIsLogin, true);

      Get.offAllNamed(Routes.loginSplashScreen);

      setState(ViewState.retrieved);
    }
  }
}
