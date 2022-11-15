import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';
import 'sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.signUp)),
      body: const SignUpBody(),
    );
  }
}
