import 'package:flutter/material.dart';
import 'package:tome/ui/constants/colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightThemeColor.background,
      backgroundColor: LightThemeColor.background,
      primaryColor: LightThemeColor.base,
      primaryColorDark: LightThemeColor.reversal,
      appBarTheme: const AppBarTheme(color: LightThemeColor.active),
      textTheme: const TextTheme(
        headline1: TextStyle(color: LightThemeColor.textStrong),
        bodyText1: TextStyle(color: LightThemeColor.textLight),
        button: TextStyle(color: LightThemeColor.textMedium),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        accentColor: LightThemeColor.base,
      ),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
      toggleableActiveColor: LightThemeColor.base,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkThemeColor.background,
      backgroundColor: DarkThemeColor.background,
      primaryColor: DarkThemeColor.base,
      primaryColorDark: DarkThemeColor.reversal,
      appBarTheme: const AppBarTheme(color: DarkThemeColor.active),
      textTheme: const TextTheme(
        headline1: TextStyle(color: DarkThemeColor.textStrong),
        bodyText1: TextStyle(color: DarkThemeColor.textLight),
        button: TextStyle(color: DarkThemeColor.textMedium),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: DarkThemeColor.base,
      ),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
      toggleableActiveColor: DarkThemeColor.base,
    );
  }
}
