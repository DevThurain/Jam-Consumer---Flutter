import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jams/src/core/constants/app_color.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: AppColor.primaryColor,
    brightness: Brightness.light,
    appBarTheme: lightAppBarTheme,
    scaffoldBackgroundColor: AppColor.white,
    iconTheme: IconThemeData(color: AppColor.contentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      displayColor: AppColor.contentColorLightTheme,
      bodyColor: AppColor.contentColorLightTheme.withOpacity(0.6),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      backgroundColor: AppColor.white,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColor.primaryColor,
      secondary: AppColor.secondaryColor,
      tertiary: AppColor.vairentWhite,
      error: Colors.red,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: AppColor.primaryColor,
    appBarTheme: darkAppBarTheme,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.contentColorLightTheme,
    iconTheme: IconThemeData(color: AppColor.contentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
        displayColor: AppColor.contentColorDarkTheme,
        bodyColor: AppColor.contentColorDarkTheme.withOpacity(0.6)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      backgroundColor: AppColor.contentColorLightTheme,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColor.primaryColor,
      secondary: AppColor.secondaryColor,
      tertiary: AppColor.vairentDark,
      error: Colors.red,
    ),
  );
}

final lightAppBarTheme = AppBarTheme(
    centerTitle: false,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.white,
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: true));

final darkAppBarTheme = AppBarTheme(
    centerTitle: false,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColor.contentColorLightTheme,
        statusBarColor: AppColor.contentColorLightTheme,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true));
