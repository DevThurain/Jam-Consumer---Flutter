import 'package:flutter/material.dart';
import 'package:jams/src/features/based_screen/based_screen.dart';
import 'package:jams/src/features/book_detail/book_detail_screen.dart';
import 'package:jams/src/features/home/home_screen.dart';
import 'package:jams/src/features/login/login_screen.dart';
import 'package:jams/src/features/test/test_screen.dart';

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

        case TestScreen.routeName:
          return const TestScreen();

        case BookDetailScren.routeName:
          return const BookDetailScren();

        default:
          return const LoginScreen();
      }
    },
  );
}
