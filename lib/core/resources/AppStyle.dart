import 'package:evently/core/resources/ColorManager.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static ThemeMode themeMode = ThemeMode.light;
  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: ColorManager.blue,
      onPrimary: Colors.white,
      secondary: ColorManager.black,
      tertiary: ColorManager.red,
      brightness: Brightness.light,
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
    ),
  );
  static ThemeData DarkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorManager.darkBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: ColorManager.blue,
      onPrimary: Colors.black,
      secondary: ColorManager.white,
      tertiary: ColorManager.red,
      brightness: Brightness.dark,
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
    ),
  );
}
