import 'package:flutter/material.dart';
import 'package:project_sadat/core/theme/app_theme.dart';
import 'package:project_sadat/core/theme/theme_mode_scope.dart';
import 'package:project_sadat/ui/signin/forget_password/forget_password_screen.dart';
import 'package:project_sadat/ui/signin/login/login_screen.dart';
import 'package:project_sadat/ui/signin/register/register_screen.dart';
import 'package:project_sadat/ui/add_event/pages/add_event_page.dart';
import 'package:project_sadat/ui/home/main_app_shell.dart';
import 'package:project_sadat/ui/onboarding/onboarding_screen.dart';
import 'package:project_sadat/ui/Start/Screen/start_screen.dart';
import 'package:project_sadat/ui/splash/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _setThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeModeScope(
      themeMode: _themeMode,
      setThemeMode: _setThemeMode,
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          StartScreen.routeName: (_) => const StartScreen(),
          OnboardingScreen.routeName: (_) => const OnboardingScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          RegisterScreen.routeName: (_) => const RegisterScreen(),
          ForgetPasswordScreen.routeName: (_) => const ForgetPasswordScreen(),
          MainAppShell.routeName: (_) => const MainAppShell(),
          AddEventPage.routeName: (_) => const AddEventPage(),
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
