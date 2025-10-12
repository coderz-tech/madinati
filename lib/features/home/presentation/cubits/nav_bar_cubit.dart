import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madinati/features/notification/presentation/view/notification_screen.dart';
import 'package:madinati/features/profile/presentation/view/profile_screen.dart';
import 'package:madinati/features/tabs/presentation/screens/tabs_screen.dart';

class NavBarCubit extends Cubit<int> {
  List<Widget> screens = [ProfileScreen(), TabsScreen(), NotificationScreen()];

  NavBarCubit() : super(0);

  void changeTab(int index) {
    emit(index);
  }

  void reset() {
    emit(0);
  }
}
