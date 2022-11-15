import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';
import 'package:pasal/presentation/resources/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pasal',
      theme: theme(),
      onGenerateRoute: Routegenerator.getRoute,
      initialRoute: Routes.signInRoute,
    );
  }
}
