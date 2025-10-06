import 'dart:ui';

class LocalEntity {
  final String code;
  final String name;
  final Locale locale;
  bool isSelected;
  bool isCurrent;

  LocalEntity({
    required this.code,
    required this.name,
    required this.locale,
    this.isSelected = false,
    this.isCurrent = false,
  });
}
