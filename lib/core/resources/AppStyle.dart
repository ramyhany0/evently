import 'package:evently/core/resources/ColorManager.dart';
import 'package:flutter/material.dart';

class AppStyle {
  // static ThemeMode themeMode = ThemeMode.light;
  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.lightBackground,
    appBarTheme: AppBarTheme(
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: ColorManager.black,
        fontSize: 22,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: ColorManager.blue,
      onPrimary: Colors.white,
      secondary: ColorManager.black,
      tertiary: ColorManager.red,
      brightness: Brightness.light,
      onPrimaryContainer: ColorManager.grey,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorManager.black,
        fontSize: 16,
      ),

      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        color: ColorManager.blue,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorManager.grey,
        fontSize: 16,
      ),
    ),
  );
  static ThemeData DarkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,

      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: ColorManager.blue,
        fontSize: 22,
      ),
    ),
    scaffoldBackgroundColor: ColorManager.darkBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: ColorManager.blue,
      onPrimary: Colors.black,
      secondary: ColorManager.white,
      tertiary: ColorManager.red,
      brightness: Brightness.dark,
      onPrimaryContainer: ColorManager.white,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorManager.white,
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        color: ColorManager.blue,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorManager.white,
        fontSize: 16,
      ),
    ),
  );
}
