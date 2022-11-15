import 'package:flutter/material.dart';
import 'package:pasal/presentation/sign_in/components/sign_in_body.dart';

import '../../resources/strings_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.emptyString)),
      body: const SignInBody(),
    );
  }
}
