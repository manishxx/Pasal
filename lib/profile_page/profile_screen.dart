import 'package:flutter/material.dart';

import 'package:pasal/profile_page/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
        centerTitle: true,
      ),
      body: ProfileBody(),
    );
  }
}
