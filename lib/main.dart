import 'package:evently/core/resources/AppStyle.dart';
import 'package:evently/core/resources/ColorManager.dart';
import 'package:evently/ui/splash/screen/splash_screen.dart';
import 'package:evently/ui/start/screen/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppStyle.LightTheme,
      darkTheme: AppStyle.DarkTheme,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        StartScreen.routeName: (_) => const StartScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
