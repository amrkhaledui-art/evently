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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorManager.background(context),
      body: Stack(
        children: [
          // Centered Logo — scales to 40% of screen width on any device
          Center(
            child: Image.asset(
              AssetsManager.logo,
              width: size.width * 0.40,
              fit: BoxFit.contain,
            )
                .animate(
                  onComplete: (controller) async {
                    await Future.delayed(const Duration(seconds: 3));
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(
                        context,
                        StartScreen.routeName,
                      );
                    }
                  },
                )
                .fadeIn(duration: 1200.ms, curve: Curves.easeIn)
                .slideY(
                  begin: 1.0,
                  end: 0.0,
                  duration: 1500.ms,
                  curve: Curves.elasticOut,
                )
                .then()
                .shimmer(
                  duration: 1500.ms,
                  color: ColorManager.primary(context).withValues(alpha: 0.3),
                ),
          ),

          // "Amr" text — proportional bottom padding
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.06),
              child: Text(
                'Amr',
                style: TextStyle(
                  color: ColorManager.primary(context),
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(delay: 500.ms, duration: 1000.ms)
              .slideY(
                begin: 0.5,
                end: 0.0,
                duration: 1200.ms,
                curve: Curves.easeOutBack,
              ),
        ],
      ),
    );
  }
}

