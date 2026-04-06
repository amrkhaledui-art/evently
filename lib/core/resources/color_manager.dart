import 'package:flutter/material.dart';

abstract final class ColorsManager {
  static const Color primaryColor = Color(0xff0E3A99);
  static const Color backgroundColor = Color(0xffF4F7FF);
  static const Color secondaryColor = Color(0xff1C1C1C);
  static const Color teritaryColor = Color(0xff686868);
  static const Color onPrimaryColor = Color(0xffffffff);
  static const Color darkBackgroundColor = Color(0xff000F30);
  static const Color darkPrimaryColor = Color(0xff457AED);
  static const Color darkSecondaryColor = Color(0xffffffff);
  static const Color darkTeritaryColor = Color(0xffD6D6D6);
  static const Color darkOnPrimaryColor = Color(0xffffffff);
  static const Color darkUnselected = Color(0xff001440);
  static const Color fieldBorder = Color(0xffF0F0F0);
  static const Color fieldBorderDark = Color(0xff002D8F);
  static const Color hintTextColor = Color(0xff686868);
  static const Color unselectedTab = Color(0xffB9B9B9);
}

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
