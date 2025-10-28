import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/responsive.dart';
import '../cubits/nav_bar_cubit.dart';

class CustomNavigationBar extends StatelessWidget {
  final void Function(int)? onTap;

  const CustomNavigationBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<NavBarCubit, int>(
      builder: (context, currentIndex) {
        final cubit = context.read<NavBarCubit>();
        final items = cubit.tabs;
        final itemCount = items.length;
        final isScrollable = itemCount > 4;

        final row = Row(
          mainAxisAlignment: isScrollable
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceAround,
          children: List.generate(itemCount, (i) {
            final t = items[i];
            final isSelected = currentIndex == i;
            final label = _resolveLabel(context, t.labelKey);

            final itemWidth = isScrollable
                ? responsiveWidth(context, 88)
                : responsiveWidth(context, 100);

            return SizedBox(
              width: itemWidth,
              child: InkWell(
                onTap: () {
                  context.read<NavBarCubit>().changeTab(i);
                  onTap?.call(i);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      isSelected ? t.selectedSvg : t.unselectedSvg,
                      // colorFilter: isSelected
                      //     ? ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn)
                      //     : null,
                      width: responsiveWidth(context, 24),
                      height: responsiveHeight(context, 24),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: responsiveHeight(context, 6)),
                    Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: isSelected
                            ? theme.textTheme.headlineMedium?.color
                            : theme.colorScheme.onSecondaryFixed,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );

        return Container(
          color: theme.colorScheme.primaryContainer,
          width: responsiveWidth(context, 430),
          height: responsiveHeight(context, 90),
          child: isScrollable
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 12),
                  ),
                  child: row,
                )
              : row,
        );
      },
    );
  }

  String _resolveLabel(BuildContext ctx, String key) {
    final loc = AppLocalizations.of(ctx)!;
    switch (key) {
      case 'profile':
        return loc.profile;
      case 'plans':
        return loc.plans;
      case 'notifications':
        return loc.notifications;
      default:
        return key; // fallback
    }
  }
}
