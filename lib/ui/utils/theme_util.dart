import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tome/ui/constants/colors.dart';

bool isDarkTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

// `a` is the alpha value, with 0 being transparent and 255 being fully
Color ThemeColor({required BuildContext context, required ColorName name, int? alpha}) {
  bool dark = isDarkTheme(context);
  Color color;
  switch (name) {
    case ColorName.base:
      color = dark ? DarkThemeColor.base : LightThemeColor.base;
      break;
    case ColorName.base1:
      color = dark ? DarkThemeColor.base1 : LightThemeColor.base1;
      break;
    case ColorName.active:
      color = dark ? DarkThemeColor.active : LightThemeColor.active;
      break;
    case ColorName.borderMain:
      color = dark ? DarkThemeColor.borderMain : LightThemeColor.borderMain;
      break;
    case ColorName.borderSub:
      color = dark ? DarkThemeColor.borderSub : LightThemeColor.borderSub;
      break;
    case ColorName.reversal:
      color = dark ? DarkThemeColor.reversal : LightThemeColor.reversal;
      break;
    case ColorName.textLight:
      color = dark ? DarkThemeColor.textLight : LightThemeColor.textLight;
      break;
    case ColorName.textMedium:
      color = dark ? DarkThemeColor.textMedium : LightThemeColor.textMedium;
      break;
    case ColorName.textStrong:
      color = dark ? DarkThemeColor.textStrong : LightThemeColor.textStrong;
      break;
    case ColorName.white:
      color = dark ? DarkThemeColor.white : LightThemeColor.white;
      break;
    case ColorName.black:
      color = dark ? DarkThemeColor.black : LightThemeColor.black;
      break;
    case ColorName.icon:
      color = dark ? DarkThemeColor.icon : LightThemeColor.icon;
      break;
    case ColorName.background:
      color = dark ? DarkThemeColor.background : LightThemeColor.background;
      break;
    case ColorName.dark:
      color = dark ? DarkThemeColor.dark : LightThemeColor.dark;
      break;
  }
  return color.withAlpha(alpha ?? 255);
}
