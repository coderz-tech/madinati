import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/bottom_nav_bar_entity.dart';
import '../config/nav_config.dart';

class NavBarCubit extends Cubit<int> {
  List<BottomNavBarEntity> tabs = const [];

  NavBarCubit() : super(0);

  void load(Actor actor) {
    final cfg = navConfig[actor];
    print('actor passed: $actor');
    print('nav keys: ${navConfig.keys.toList()}');
    print('items found: ${cfg?.length ?? 0}');
    tabs = List.of(cfg ?? const []);

    emit(0);
  }

  void changeTab(int index) => emit(index);
}