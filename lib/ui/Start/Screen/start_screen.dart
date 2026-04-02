import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/stringsManager.dart';
import 'package:project_sadat/core/reusable/custom_buttom.dart';
import 'package:project_sadat/ui/Start/Widgts/LanguageSwitch.dart';
import 'package:project_sadat/ui/Start/Widgts/ThemeSwitch.dart';
import 'package:project_sadat/ui/onboarding/onboarding_screen.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "start";

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logo,
          height: 27,
          fit: BoxFit.fitHeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetsManager.beingCreative,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            SizedBox(height: 24),
            Text(
              StringsManager.startTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            Text(
              StringsManager.startDesc,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.language,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Languageswitch("en"),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.theme,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                ThemeSwitch("light"),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: StringsManager.letsStart,
                onClick: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const OnboardingScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
