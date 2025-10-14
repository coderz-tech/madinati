import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsCubit extends Cubit<int> {
  List<Widget>? screens;
  List<String>? titles;

  TabsCubit() : super(0);

  Future<void> initial({
    required List<Widget> screens,
    required List<String> titles,
  }) async {
    this.screens = screens;
    this.titles = titles;
  }

  void changeTab(int index) => emit(index);

  void reset() {
    emit(0);
  }
}
