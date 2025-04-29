import 'dart:async';
import 'package:evently/core/resources/AssetManager.dart';
import 'package:evently/ui/start/screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, StartScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(Assetmanager.Logo)
                .animate()
                .slideX(duration: Duration(milliseconds: 800))
                .then()
                .scale(begin: Offset(0.5, 0.5)),
            Spacer(),
            Image.asset(Assetmanager.Branding),
          ],
        ),
      ),
    );
  }
}
