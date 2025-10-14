import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  iconTheme: IconThemeData(color: AppColors.blackText),

  // --- AppBar ---------------------------------------------------------------
  appBarTheme: AppBarTheme(
    centerTitle: true,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: AppColors.iconBlack),
    titleTextStyle: TextStyle(
      color: AppColors.blackText,
      fontSize: 22.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    backgroundColor: AppColors.background,
    elevation: 0,
  ),

  // --- TextTheme ------------------------------------------------------------
  textTheme: TextTheme(
    // ############Black Text#####################
    headlineLarge: TextStyle(
      color: AppColors.blackText,
      fontSize: 24.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: AppColors.blackText,
      fontSize: 16.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: AppColors.blackText,
      fontSize: 14.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    // ############green Text#####################
    displayLarge: TextStyle(
      color: AppColors.onPrimaryContainer,
      fontSize: 24.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: AppColors.onPrimaryContainer,
      fontSize: 18.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      color: AppColors.onPrimaryContainer,
      fontSize: 14.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    // ############white Text#####################
    titleLarge: TextStyle(
      color: AppColors.whiteText,
      fontSize: 18.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: AppColors.whiteText,
      fontSize: 18.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: AppColors.whiteText,
      fontSize: 14.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    // ############Grey Text#####################
    labelLarge: TextStyle(
      color: AppColors.greyText,
      fontSize: 18.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w800,
    ),
    labelMedium: TextStyle(
      color: AppColors.greyText,
      fontSize: 16.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: AppColors.greyText,
      fontSize: 14.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    // ############Primary Text#####################
    bodyLarge: TextStyle(
      color: AppColors.primary,
      fontSize: 20.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w800,
    ),
    bodyMedium: TextStyle(
      color: AppColors.primary,
      fontSize: 16.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: AppColors.primary,
      fontSize: 14.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    // ############error Text#####################
    // errorLarge: TextStyle(
    //   color: AppColors.error,
    //   fontSize: 18.sp,
    //   fontFamily: 'Helvetica',
    //   fontWeight: FontWeight.w800,
    // ),

  ),

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    inversePrimary: AppColors.inversePrimary,
    onPrimaryFixed: AppColors.onPrimaryFixed,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    error: AppColors.error,
    onError: AppColors.onError,
    background: AppColors.background,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    inverseSurface: AppColors.correct,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    shadow: AppColors.shadow,
    primaryFixed: AppColors.orange,
  ),

  // --- InputDecoration ------------------------------------------------------
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.outline),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),
    labelStyle: TextStyle(
      color: AppColors.secondaryContainer,
      fontSize: 16.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),
    hintStyle: TextStyle(
      color: AppColors.greyText,
      fontSize: 14.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w400,
    ),

  ),

  // --- BottomNav ------------------------------------------------------------
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.onPrimary,
    unselectedLabelStyle: TextStyle(
      color: AppColors.secondaryContainer,
      fontSize: 14.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w500,
    ),
    selectedLabelStyle: TextStyle(
      color: AppColors.primary,
      fontSize: 14.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w500,
    ),
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.greyText,
  ),
);
