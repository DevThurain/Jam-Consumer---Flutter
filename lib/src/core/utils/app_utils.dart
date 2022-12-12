import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUtils {
  static void setAppBarAndSystemNavigationBarColor(
      {required Color color, Brightness iconBrightness = Brightness.dark}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: color,
        statusBarColor: color,
        statusBarIconBrightness: iconBrightness,
        systemStatusBarContrastEnforced: true));
  }
}
