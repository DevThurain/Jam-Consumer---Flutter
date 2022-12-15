import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:jams/src/core/constants/app_color.dart';

class AppUtils {
  static void setAppBarAndSystemNavigationBarColor(
      {required Color color, Brightness iconBrightness = Brightness.dark}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: color,
        statusBarColor: color,
        statusBarIconBrightness: iconBrightness,
        systemStatusBarContrastEnforced: true));
  }

  static void autoStatusBarAndSystemNavigationBarColor() {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: AppColor.contentColorLightTheme,
          statusBarColor: AppColor.contentColorLightTheme,
          statusBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: AppColor.white,
          statusBarColor: AppColor.white,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true));
    }
  }

  static SystemUiOverlayStyle autoUiOverlayStyle() {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    
    if (isDarkMode) {
      return SystemUiOverlayStyle(
          systemNavigationBarColor: AppColor.contentColorLightTheme,
          statusBarColor: AppColor.contentColorLightTheme,
          statusBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true);
    } else {
      return SystemUiOverlayStyle(
          systemNavigationBarColor: AppColor.white,
          statusBarColor: AppColor.white,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true);
    }
  }
}
