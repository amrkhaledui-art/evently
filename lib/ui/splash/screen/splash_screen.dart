import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/color_manager.dart';
import 'package:project_sadat/ui/Start/Screen/start_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Centered Logo with enhanced fluid animation
          Center(
            child: Image.asset(
              AssetsManager.logo,
              width: 220,
            )
                .animate(
                  onComplete: (controller) async {
                    // Increased delay to 3 seconds before navigation
                    await Future.delayed(const Duration(seconds: 3));
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(context, StartScreen.routeName);
                    }
                  },
                )
                .fadeIn(duration: 1200.ms, curve: Curves.easeIn)
                .slideY(
                  begin: 1.0, // Starts from further down for more coverage
                  end: 0.0,
                  duration: 1500.ms,
                  curve: Curves.elasticOut, // More fluid, bouncy entry
                )
                .then()
                .shimmer(duration: 1500.ms, color: ColorManager.primary(context).withOpacity(0.3)),
          ),
          
          // "Amr" Text at the bottom with synchronized bold styling
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Text(
                "Amr",
                style: TextStyle(
                  color: ColorManager.primary(context),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(delay: 500.ms, duration: 1000.ms)
              .slideY(begin: 0.5, end: 0.0, duration: 1200.ms, curve: Curves.easeOutBack),
        ],
      ),
    );
  }
}

