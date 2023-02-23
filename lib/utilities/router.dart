// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/utilities/routes.dart';
import 'package:e_commerce_app/views/pages/auth_page.dart';
import 'package:e_commerce_app/views/pages/botton_navbar.dart';
import 'package:e_commerce_app/views/pages/landing_page.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => AuthPage(),
        settings: settings,
      );
    case AppRoutes.bottonNavBarRoute:
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => BottonNavBar(),
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
