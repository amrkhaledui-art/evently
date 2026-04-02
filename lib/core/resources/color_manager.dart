import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/colorsManager.dart';

/// Theme-aware colors aligned with [ColorsManager]. Pair with
/// [Theme.of(context).textTheme] for typography in light and dark mode.
abstract class ColorManager {
  ColorManager._();

  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color white(BuildContext context) => Colors.white;

  static Color darkGrey(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ColorsManager.darkTeritaryColor
          : ColorsManager.teritaryColor;

  static Color background(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color indicatorInactive(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ColorsManager.darkUnselected.withValues(alpha: 0.55)
          : ColorsManager.unselectedTab.withValues(alpha: 0.65);

  /// Muted text (captions, hints, secondary labels).
  static Color textSecondary(BuildContext context) => darkGrey(context);

  /// Primary body / title text (high emphasis).
  static Color textPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ColorsManager.darkSecondaryColor
          : ColorsManager.secondaryColor;

  /// Inactive UI chrome (dividers, inactive dots, hint text emphasis).
  static Color unselectedTab(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ColorsManager.darkUnselected.withValues(alpha: 0.75)
          : ColorsManager.unselectedTab;

  /// Outlined field / card borders.
  static Color borderField(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ColorsManager.fieldBorderDark
          : ColorsManager.fieldBorder;

  /// Text field fill (light cards on dark, white on light).
  static Color inputFill(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ColorsManager.darkUnselected.withValues(alpha: 0.45)
          : ColorsManager.backgroundColor;
}
