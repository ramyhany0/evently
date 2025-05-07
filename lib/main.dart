import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AppStyle.dart';
import 'package:evently/core/resources/ColorManager.dart';
import 'package:evently/ui/splash/screen/splash_screen.dart';
import 'package:evently/ui/start/screen/start_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
      path: 'assets/translations',
      fallbackLocale: Locale("en"),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: AppStyle.themeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: AppStyle.LightTheme,
      darkTheme: AppStyle.DarkTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        StartScreen.routeName: (_) => StartScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
