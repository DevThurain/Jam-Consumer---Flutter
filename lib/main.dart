import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jams/src/data/vos/book_vo.dart';
import 'package:jams/src/persistence/hive_constants.dart';

import 'src/app.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  await _initializeHive();
  // _setAppBarAndSystemNavigationBarColor();
  runApp(MyApp());
}

_initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());

  await Hive.openBox<BookVO>(HiveConstants.BOX_NAME_BOOK);
}

_setAppBarAndSystemNavigationBarColor() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true));
}
