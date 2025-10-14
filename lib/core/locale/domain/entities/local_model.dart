import 'dart:ui';

class LocalModel {
  final String code;
  final String name;
  final Locale locale;
  bool isSelected;
  bool isCurrent;

  LocalModel({
    required this.code,
    required this.name,
    required this.locale,
    this.isSelected = false,
    this.isCurrent = false,
  });
}
