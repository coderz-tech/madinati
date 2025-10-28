// lib/features/nav/presentation/config/nav_config.dart

import 'package:madinati/features/notification/presentation/view/notification_screen.dart';
import 'package:madinati/features/tabs/presentation/screens/tabs_screen.dart';

import '../../../../core/constants/svgs.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../../../violations/presentation/monitor_manager/view/violation_main_screen.dart';
import '../../domain/entity/bottom_nav_bar_entity.dart';

enum Actor {
  driver,
  operationManager,
  worker,
  monitorManager,
}

final Map<Actor, List<BottomNavBarEntity>> navConfig = {
  Actor.driver: [
    BottomNavBarEntity(
      labelKey: 'profile',
      unselectedSvg: Svgs.unselectedProfile,
      selectedSvg:   Svgs.selectedProfile,
      screen: const ProfileScreen(),
    ),
    BottomNavBarEntity(
      labelKey: 'plans',
      unselectedSvg: Svgs.unselectedOperation,
      selectedSvg:   Svgs.selectedPlans,
      screen: const TabsScreen(),
    ),
    BottomNavBarEntity(
      labelKey: 'notifications',
      unselectedSvg: Svgs.unselectedNotification,
      selectedSvg:   Svgs.selectedNotification,
      screen: const NotificationScreen(),
    ),
  ],

  Actor.monitorManager: [
    BottomNavBarEntity(
      labelKey: 'profile',
      unselectedSvg: Svgs.unselectedProfile,
      selectedSvg:   Svgs.selectedProfile,
      screen: const ProfileScreen(),
    ),
    BottomNavBarEntity(
      labelKey: 'notifications',
      unselectedSvg: Svgs.unselectedNotification,
      selectedSvg:   Svgs.selectedNotification,
      screen: const NotificationScreen(),
    ),
    BottomNavBarEntity(
      labelKey: 'violations',
      unselectedSvg: Svgs.unselectedReceiptItem,
      selectedSvg:   Svgs.selectedReceiptItem,
      screen: const ViolationMainScreen(),
    ),
    BottomNavBarEntity(
      labelKey: 'reports',
      unselectedSvg: Svgs.unselectedReports,
      selectedSvg:   Svgs.selectedReports,
      screen: const TabsScreen(),
    ),

  ],
  Actor.worker: [

  ],
  Actor.operationManager: [

  ],
};