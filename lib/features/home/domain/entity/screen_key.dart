// lib/features/nav/presentation/view/screen_registry.dart
import 'package:flutter/widgets.dart';
import '../../../notification/presentation/view/notification_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../../../tabs/presentation/screens/tabs_screen.dart';

class ScreenRegistry {
  static Widget of(String key) {
    switch (key) {
      case 'ProfileScreen':       return const ProfileScreen();
      case 'PlansScreen':         return const TabsScreen();
      case 'NotificationsScreen': return const NotificationScreen();
      default:                    return const SizedBox.shrink();
    }
  }
}