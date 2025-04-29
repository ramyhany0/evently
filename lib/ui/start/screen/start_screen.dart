import 'package:evently/core/resources/AssetManager.dart';
import 'package:evently/core/resources/StringManager.dart';
import 'package:evently/core/reusable_components/CustomButton.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = 'start';

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Assetmanager.logoBar, height: 50, width: 150),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                Theme.of(context).colorScheme.brightness == Brightness.dark
                    ? Assetmanager.startDark
                    : Assetmanager.startLight,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 28),
            Text(
              Stringmanager.startTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 28),
            Text(
              Stringmanager.startDesc,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 28),
            Row(
              children: [
                Text(
                  Stringmanager.language,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  Stringmanager.theme,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            Custombutton(title: Stringmanager.begin, onClicked: () {}),

            // Navigate to the next screen
          ],
        ),
      ),
    );
  }
}
