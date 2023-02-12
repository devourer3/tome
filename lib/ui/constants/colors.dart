// https://shiningjean.tistory.com/77

import 'dart:ui';

/* alpha
    100% = FF (불투명)
    90% = E6
    80% = CC
    70% = B3
    60% = 99
    50% = 80
    40% = 66
    30% = 4D
    20% = 33
    10% = 1A
    0% = 00 (투명)
 */

enum ColorName {
  base,
  base1,
  reversal,
  textLight,
  textMedium,
  textStrong,
  active,
  white,
  black,
  dark,
  borderMain,
  borderSub,
  icon,
  background
}

class LightThemeColor {
  static const base = Color(0xFFFFFFFF);
  static const base1 = Color(0xFFF2F2F2);
  static const reversal = Color(0xFF000000);
  static const textLight = Color(0xFF8D8D8D);
  static const textMedium = Color(0xFF7B7B7B);
  static const textStrong = Color(0xFF4B4B4B);
  static const active = Color(0xFFFF6255);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const borderMain = Color(0xFF42434B);
  static const borderSub = Color(0xFF42434B);
  static const icon = Color(0xFF9C9C9C);
  static const background = Color(0xFFF4F4F7);
  static const dark = Color(0xFF1C1F26);
}

class DarkThemeColor {
  static const base = Color(0xFF26282E);
  static const base1 = Color(0xFF3B3D42);
  static const reversal = Color(0xFFFFFFFF);
  static const textLight = Color(0xFF767676);
  static const textMedium = Color(0xFFADADB2);
  static const textStrong = Color(0xFFFAFAFA);
  static const active = Color(0xFFFF6255);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const borderMain = Color(0xFFD5D5D5);
  static const borderSub = Color(0xFFE6E6E6);
  static const icon = Color(0xFF8C9095);
  static const background = Color(0xFF272A30);
  static const dark = Color(0xFF1C1F26);
}
