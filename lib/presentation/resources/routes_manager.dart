import 'package:flutter/material.dart';
import 'package:pasal/models/products.dart';
import 'package:pasal/presentation/cart/cart_screen.dart';
import 'package:pasal/presentation/cart/components/body.dart';
import 'package:pasal/presentation/cart/details/components/body.dart';
import 'package:pasal/presentation/home_screen/home_screen.dart';
import 'package:pasal/presentation/intro_screen/intro_screen.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/sign_up/components/sign_up_screen.dart';
import 'package:pasal/presentation/widgets/login_splash.dart';
import 'package:pasal/presentation/widgets/product_card.dart';

import '../cart/details/components/details_screen.dart';
import '../sign_in/components/sign_in_screen.dart';
import '../sign_up/components/complete_profile/complete_profile_screen.dart';

class Routes {
  static const String initialScreenRoute = "/";
  static const String signInRoute = "/signIn";
  static const String signUpRoute = "/signUp";
  static const String homeScreenRoute = "/homeScreen";
  static const String productDetailsRoute = "/product-card";
  static const String loginSplashScreen = "/splash-screen";
  static const String cartRoute = "/cart";

  static const String completeProfileRoute = "/complete_profile";
}

class Routegenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.initialScreenRoute:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.completeProfileRoute:
        return MaterialPageRoute(builder: (_) => const CompleteProFileScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());
      case Routes.loginSplashScreen:
        return MaterialPageRoute(builder: (_) => const LoginSplash());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => CartScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.noRouteFound),
            ),
            body: const Center(
              child: Text(AppStrings.noRouteFound),
            )));
  }
}
