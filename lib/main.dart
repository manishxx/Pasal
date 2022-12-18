import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/data/local/shared_preferences/shared_preference_manager.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';
import 'package:pasal/presentation/resources/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.getInstance();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then(
        (value) => log("getToken: $value"),
      );
  //if application is in background, then it will work
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    log("onMessageOpenedApp: $message");
    Navigator.pushNamed(
        navigatorKey.currentState!.context, Routes.homeScreenRoute,
        arguments: {"message": json.encode(message.data)});
  });

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      Navigator.pushNamed(
          navigatorKey.currentState!.context, Routes.homeScreenRoute,
          arguments: {"message": json.encode(message.data)});
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("_firebaseMessagingBackgroundHandler: $message");
}

class MyApp extends StatelessWidget {
  final SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pasal',
        theme: theme(),
        onGenerateRoute: Routegenerator.getRoute,
        initialRoute: sharedPreferencesManager
                    .getBool(SharedPreferencesManager.keyIsLogin) !=
                null
            ? sharedPreferencesManager
                    .getBool(SharedPreferencesManager.keyIsLogin)!
                ? Routes.homeScreenRoute
                : Routes.signInRoute
            : Routes.signInRoute);
  }
}
