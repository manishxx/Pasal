import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/base_model/base_model.dart';

import '../../app/constants/enums.dart';
import '../../data/local/shared_preferences/shared_preference_manager.dart';
import '../../data/network/api_auth_provider.dart';
import '../../models/token.dart';

class SignupController extends BaseController {
  final formKey = GlobalKey<FormState>();

  String? password;
  List errors = [].obs;
  var isObscureText = true.obs;
  String? email;

  String? name;
  Token? token;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  void mapInputsRegister() {
    Map map = {
      "username": nameController.text.trim(),
      "password": passwordController.text.trim(),
      "email": emailController.text.trim(),
    };
    log("------------map: $map");
    registerUser(map);
  }

  void registerUser(Map map) async {
    setState(ViewState.busy);
    token = await apiAuthProvider.register(map);

    if (token == null) {
      Fluttertoast.showToast(
          msg: "Check your credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.blue[300],
          textColor: Colors.white,
          fontSize: 16.0);
      setState(ViewState.error);
    } else {
      setState(ViewState.retrieved);
    }
  }
}
