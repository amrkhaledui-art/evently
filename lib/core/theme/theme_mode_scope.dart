import 'package:flutter/material.dart';

/// Provides app-wide theme mode updates for widgets below [MaterialApp].
class ThemeModeScope extends InheritedWidget {
  const ThemeModeScope({
    super.key,
    required this.themeMode,
    required this.setThemeMode,
    required super.child,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> setThemeMode;

  static ThemeModeScope of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<ThemeModeScope>();
    assert(scope != null, 'ThemeModeScope not found');
    return scope!;
  }

  @override
  bool updateShouldNotify(ThemeModeScope oldWidget) =>
      themeMode != oldWidget.themeMode;
}
