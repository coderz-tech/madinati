import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madinati/features/tabs/presentation/screens/tabs_screen.dart';

class NavBarCubit extends Cubit<int> {
  List<Widget> screens = [Text("data"), TabsScreen(), Text("data")];

  NavBarCubit() : super(0);

  void changeTab(int index) {
    emit(index);
  }

  void reset() {
    emit(0);
  }
}
