import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF00AAB8);
  static const Color darkPrimary = Color(0xFF7399C6);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color inversePrimary = Color(0x7573A8AE);
  static const Color onPrimaryFixed = Color(0x30DAE0E7);
  static const Color secondary = Color(0xFF7399C6);
  static const Color secondaryDark = Color(0xFF060C1D);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF57A2A7);
  static const Color primaryContainer = Color(0xFFF7FAFB);
  static const Color orange = Color(0xFFF8971D);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF57A2A7), Color(0xFF88B388)], // blue to purple
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color blackText = Color(0xFF414141);
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color greyText = Color(0xFF7E7F83);
  static const Color iconBlack = Color(0xFF414141);
  static const Color secondaryContainer = Color(0xFF97A1B0);
  static const Color onSecondaryContainer = Color(0xFF111111);
  static const Color surface = Color(0xFF74777F);
  static const Color onSurface = Color(0xFF414141);
  static const Color background = Color(0xFFF6F6F6);
  static const Color outline = Color(0xFFA7AEC1);
  static const Color outlineVariant = Color(0xFFC4C7CF);
  static const Color shadow = Color(0x21231F20);
  static const Color lightTextSecondary = Color(0xFF7E7F83);
  static const Color darkBackground = Color(0xFF12172A);
  static const Color darkSurface = Color(0xFF060C1D);
  static const Color darkContainer = Color(0xFF242A3A);
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);
}
