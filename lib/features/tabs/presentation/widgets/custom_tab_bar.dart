import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/responsive.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabNames;
  final Function(int) onTap;
  final int selectedIndex;

  const CustomTabBar({
    super.key,
    required this.tabNames,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 4),
          vertical: responsiveHeight(context, 4),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(tabNames.length, (index) {
                final isSelected = selectedIndex == index;
                return Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: responsiveWidth(context, 2),
                  ),
                  child: GestureDetector(
                    onTap: () => onTap(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: responsiveHeight(context, 40),

                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 13.5),
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? theme.colorScheme.primary
                                  : null,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            tabNames[index],
                            style: theme.textTheme.labelLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: isSelected ? FontWeight.w700: FontWeight.w400,
                              color:
                                  isSelected
                                      ? theme.colorScheme.onPrimary
                                      : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
