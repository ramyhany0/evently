import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AppStyle.dart';
import 'package:evently/core/resources/AssetManager.dart';
import 'package:evently/core/resources/StringManager.dart';
import 'package:evently/core/reusable_components/CustomButton.dart';
import 'package:evently/core/reusable_components/CustomSwitch.dart';
import 'package:evently/ui/register/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/PrefsManager.dart';
import '../../../providers/ThemeProvider.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = 'start';

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int selectedLanguage = 0;

  int selectedTheme = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    selectedLanguage = context.locale.languageCode == "ar" ? 1 : 0;
    selectedTheme = provider.themeMode == ThemeMode.dark ? 1 : 0;
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
              StringManager.startTitle.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 28),
            Text(
              StringManager.startDesc.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringManager.language.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Customswitch(
                  item1: Assetmanager.us,
                  item2: Assetmanager.eg,
                  selected: selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value;
                      if (value == 1) {
                        context.setLocale(Locale("ar"));
                      } else {
                        context.setLocale(Locale("en"));
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringManager.theme.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Customswitch(
                  item1: Assetmanager.sun,
                  item2: Assetmanager.moon,
                  isColored: true,
                  selected: selectedTheme,
                  onChanged: (value) {
                    setState(() {
                      selectedTheme = value;
                      if (selectedTheme == 1) {
                        provider.changeTheme(ThemeMode.dark);
                        PrefsManager.saveThemeMode(true);
                      } else {
                        provider.changeTheme(ThemeMode.light);
                        PrefsManager.saveThemeMode(false);
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 28),
            Custombutton(
              title: StringManager.begin.tr(),
              onClicked: () {
                Navigator.pushReplacementNamed(
                  context,
                  RegisterScreen.routeName,
                );
              },
            ),

            // Navigate to the next screen
          ],
        ),
      ),
    );
  }
}
