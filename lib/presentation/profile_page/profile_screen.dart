import 'package:flutter/material.dart';

import 'package:pasal/presentation/profile_page/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
        ),
        centerTitle: true,
      ),
      body: const ProfileBody(),
    );
  }
}
