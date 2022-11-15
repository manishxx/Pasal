import 'package:flutter/material.dart';
import 'package:pasal/presentation/sign_up/components/complete_profile/complete_profile_body.dart';

import '../../../resources/strings_manager.dart';

class CompleteProFileScreen extends StatelessWidget {
  const CompleteProFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signUp),
      ),
      body: const CompleteProfileBody(),
    );
  }
}
