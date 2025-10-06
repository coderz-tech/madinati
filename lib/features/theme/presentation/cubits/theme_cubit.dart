import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_is_dark_theme.dart';
import '../../domain/usecases/set_is_dark_theme.dart';
import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit({required this.getIsDarkTheme, required this.setIsDarkTheme})
    : super(lightTheme) {
    _initializeTheme();
  }

  final GetIsDarkTheme getIsDarkTheme;
  final SetIsDarkTheme setIsDarkTheme;

  bool isDarkTheme = true;

  Future<void> _initializeTheme() async {
    isDarkTheme = await getIsDarkTheme();
    emit(isDarkTheme ? darkTheme : lightTheme);
  }

  Future<void> toggleTheme() async {
    isDarkTheme = !isDarkTheme;
    emit(isDarkTheme ? darkTheme : lightTheme);
    await setIsDarkTheme(isDarkTheme: isDarkTheme);
  }
}
