import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/nav_bar_cubit.dart';
import '../widgets/custom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NavBarCubit>();
    print(cubit.tabs);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<NavBarCubit, int>(
        builder: (context, index) {
          if (cubit.tabs.isEmpty) return const SizedBox.shrink();
          return IndexedStack(
            index: index,
            children: cubit.tabs.map((t) => t.screen).toList(),
          );
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}