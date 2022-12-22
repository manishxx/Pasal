import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/routes_manager.dart';

class LoginSplash extends StatefulWidget {
  const LoginSplash({super.key});
  @override
  State<LoginSplash> get createState => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    log("message");
    await Future.delayed(const Duration(seconds: 2));

    return Get.offNamed(Routes.homeScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Login Success!',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
