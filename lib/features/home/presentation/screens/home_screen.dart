import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/svgs.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/custom_Navigation_bar.dart';
import '../cubits/nav_bar_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<NavBarCubit, int>(
        builder: (context, selectedIndex) {
          return context.read<NavBarCubit>().screens[selectedIndex];
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: BlocBuilder<NavBarCubit, int>(
      //   builder: (context, selectedIndex) {
      //     return Container(
      //       width: responsiveWidth(context, 76),
      //       height: responsiveHeight(context, 76),
      //       decoration: BoxDecoration(
      //         color: context.read<NavBarCubit>().state == 0
      //             ? Theme.of(context).colorScheme.primary
      //             : Theme.of(context).colorScheme.secondaryContainer,
      //
      //         shape: BoxShape.circle,
      //       ),
      //       child: Material(
      //         color: Colors.transparent,
      //         shape: const CircleBorder(),
      //         child: InkWell(
      //           onTap: () {
      //             context.read<NavBarCubit>().changeTab(0);
      //           },
      //           customBorder: const CircleBorder(),
      //           child: Center(
      //             child: SvgPicture.asset(
      //               Svgs.inbox,
      //               width: responsiveWidth(context, 42),
      //               height: responsiveHeight(context, 42),
      //               fit: BoxFit.contain,
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
      bottomNavigationBar: CustomNavigationBar(
        mainTabIcon: Svgs.inbox,
        secondaryIcons: [Svgs.unselectedProfile,Svgs.unselectedOperation,Svgs.unselectedNotification ],
        selectedIcons: [Svgs.selectedProfile,Svgs.selectedPlans ,Svgs.selectedNotification],
        secondaryLabels: [1121, 1086],
        onTap: (index) {},
      ),
    );
  }
}
