import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AppStyle.dart';
import 'package:evently/core/resources/ColorManager.dart';
import 'package:evently/providers/ThemeProvider.dart';
import 'package:evently/ui/register/screen/register_screen.dart';
import 'package:evently/ui/splash/screen/splash_screen.dart';
import 'package:evently/ui/start/screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/PrefsManager.dart';
import 'ui/forget_pass/screen/forget_pass_screen.dart';
import 'ui/home/screen/home_screen.dart';
import 'ui/login/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PrefsManager.init();
  bool isDark = PrefsManager.getThemeMode();
  ThemeMode mode = isDark ? ThemeMode.dark : ThemeMode.light;
  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
      path: 'assets/translations',
      fallbackLocale: Locale("en"),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(mode),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'evently',
      theme: AppStyle.LightTheme,
      darkTheme: AppStyle.DarkTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        StartScreen.routeName: (_) => StartScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        ForgetPassScreen.routeName: (_) => ForgetPassScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute:
          FirebaseAuth.instance.currentUser != null
              ? StartScreen.routeName
              : HomeScreen.routeName,
    );
  }
}
