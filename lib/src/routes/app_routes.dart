import 'package:flutter/material.dart';
import 'package:jams/src/features/based_screen/based_screen.dart';
import 'package:jams/src/features/home/home_screen.dart';
import 'package:jams/src/features/login/login_screen.dart';

Route<dynamic> appRouter(RouteSettings routeSettings) {
  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      switch (routeSettings.name) {
        case HomeScreen.rotueName:
          return const HomeScreen();

        case BasedScreen.routeName:
          return const BasedScreen();

        case LoginScreen.routeName:
          return const LoginScreen();

        default:
          return const LoginScreen();
      }
    },
  );
}
