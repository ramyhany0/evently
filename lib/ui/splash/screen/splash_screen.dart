import 'dart:async';
import 'package:evently/core/resources/AssetManager.dart';
import 'package:evently/providers/UserProvider.dart';
import 'package:evently/ui/start/screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:evently/model/User.dart' as MyUser;
import 'package:provider/provider.dart';

import '../../../core/FirebaseHandler.dart';
import '../../home/screen/home_screen.dart';

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
    navigateToNext();
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
            Image.asset(AssetManager.Logo)
                .animate()
                .slideX(duration: Duration(milliseconds: 800))
                .then()
                .scale(begin: Offset(0.5, 0.5)),
            Spacer(),
            Image.asset(AssetManager.Branding),
          ],
        ),
      ),
    );
  }

  /*
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        FirebaseAuth.instance.currentUser != null
            ? StartScreen.routeName
            : HomeScreen.routeName,
      );
    });


   */
  navigateToNext() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, StartScreen.routeName);
      });
    }
  }
}
