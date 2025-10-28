import 'package:flutter/material.dart';


class BottomNavBarEntity {
  final String labelKey;
  final String unselectedSvg;
  final String selectedSvg;
  final Widget screen;

  const BottomNavBarEntity({
    required this.labelKey,
    required this.unselectedSvg,
    required this.selectedSvg,
    required this.screen,
  });
}
