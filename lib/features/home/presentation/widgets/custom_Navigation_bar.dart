import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/responsive.dart';
import '../../../../l10n/app_localizations.dart';
import '../cubits/nav_bar_cubit.dart';

class CustomNavigationBar extends StatelessWidget {
  final String mainTabIcon;
  final List<String> secondaryIcons;
  final List<String> selectedIcons;
  final List<int> secondaryLabels;
  final void Function(int)? onTap;

  const CustomNavigationBar({
    super.key,
    required this.mainTabIcon,
    required this.secondaryIcons,
    required this.selectedIcons,
    required this.secondaryLabels,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<NavBarCubit, int>(
      builder: (context, selectedIndex) {
        final currentIndex = selectedIndex;
        return Container(
          color: theme.colorScheme.primaryContainer,
          width: responsiveWidth(context, 430),
          height: responsiveHeight(context, 90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Tab 0
              SizedBox(
                width: responsiveWidth(context, 110),
                child: InkWell(
                  onTap: () {
                    context.read<NavBarCubit>().changeTab(0);
                    onTap?.call(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        currentIndex == 0
                            ? selectedIcons[0]
                            : secondaryIcons[0],
                        colorFilter: currentIndex == 0
                            ? ColorFilter.mode(
                                theme.colorScheme.primary,
                                BlendMode.srcIn,
                              )
                            : null,
                        width: responsiveWidth(context, 24),
                        height: responsiveHeight(context, 24),
                        fit: BoxFit.contain,
                      ),
                      Text(
                        AppLocalizations.of(context)!.profile,
                        style: TextStyle(
                          color: currentIndex == 0
                              ? theme.colorScheme.primary
                              : theme.textTheme.labelSmall?.color,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Tab 1
              SizedBox(
                width: responsiveWidth(context, 110),
                child: InkWell(
                  onTap: () {
                    context.read<NavBarCubit>().changeTab(1);
                    onTap?.call(1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        currentIndex == 1
                            ? selectedIcons[1]
                            : secondaryIcons[1],
                        colorFilter: currentIndex == 1
                            ? ColorFilter.mode(
                                theme.colorScheme.primary,
                                BlendMode.srcIn,
                              )
                            : null,
                        width: responsiveWidth(context, 24),
                        height: responsiveHeight(context, 24),
                        fit: BoxFit.contain,
                      ),
                      Text(
                        AppLocalizations.of(context)!.plans,
                        style: TextStyle(
                          color: currentIndex == 1
                              ? theme.colorScheme.primary
                              : theme.textTheme.labelSmall?.color,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Tab 2
              SizedBox(
                width: responsiveWidth(context, 110),
                child: InkWell(
                  onTap: () {
                    context.read<NavBarCubit>().changeTab(2);
                    onTap?.call(2);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        currentIndex == 2
                            ? selectedIcons[2]
                            : secondaryIcons[2],
                        colorFilter: currentIndex == 2
                            ? ColorFilter.mode(
                                theme.colorScheme.primary,
                                BlendMode.srcIn,
                              )
                            : null,
                        width: responsiveWidth(context, 24),
                        height: responsiveHeight(context, 24),
                        fit: BoxFit.contain,
                      ),
                      Text(
                        AppLocalizations.of(context)!.notifications,
                        style: TextStyle(
                          color: currentIndex == 2
                              ? theme.colorScheme.primary
                              : theme.textTheme.labelSmall?.color,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
