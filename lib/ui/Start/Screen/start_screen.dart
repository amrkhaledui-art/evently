import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/stringsManager.dart';
import 'package:project_sadat/core/widgets/custom_button.dart';
import 'package:project_sadat/ui/Start/Widgts/LanguageSwitch.dart';
import 'package:project_sadat/ui/Start/Widgts/ThemeSwitch.dart';
import 'package:project_sadat/ui/onboarding/onboarding_screen.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "start";

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logo,
          height: 27,
          fit: BoxFit.fitHeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image scales to 40% of screen height
            SizedBox(
              height: size.height * 0.40,
              width: double.infinity,
              child: Image.asset(
                AssetsManager.beingCreative,
                fit: BoxFit.contain,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              StringsManager.startTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              StringsManager.startDesc,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
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
            SizedBox(height: size.height * 0.05),
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

