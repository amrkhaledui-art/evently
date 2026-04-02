 import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/colorsManager.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),

    scaffoldBackgroundColor: ColorsManager.backgroundColor,
    colorScheme: ColorScheme.light(
      primary: ColorsManager.primaryColor,
    secondary: ColorsManager.secondaryColor,
    tertiary: ColorsManager.teritaryColor,
    onPrimary: ColorsManager.onPrimaryColor,
      onPrimaryContainer: ColorsManager.primaryColor,
      onSecondaryContainer: Colors.white,
  ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: ColorsManager.secondaryColor
      ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorsManager.teritaryColor
          ),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: ColorsManager.primaryColor

        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
    )
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),

    scaffoldBackgroundColor: ColorsManager.darkBackgroundColor,
    colorScheme: ColorScheme.dark(
  primary: ColorsManager.darkPrimaryColor,
    secondary: ColorsManager.darkSecondaryColor,
    tertiary: ColorsManager.darkTeritaryColor,
    onPrimary: ColorsManager.darkPrimaryColor,
        onPrimaryContainer: Colors.white,
      onSecondaryContainer: ColorsManager.darkUnselected,


  ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: ColorsManager.darkSecondaryColor
          ),
          bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorsManager. darkTeritaryColor
          ),
          titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white

      ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        )
      )
  );
 }