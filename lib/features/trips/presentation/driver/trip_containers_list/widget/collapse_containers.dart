import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madinati/core/presentation/widgets/custom_button.dart';
import '../../../../../../../core/constants/svgs.dart';
import '../../../../../../../core/utils/responsive.dart';
import '../../../../../../../l10n/app_localizations.dart';
import 'container_cards.dart';

class ContainerCard extends StatelessWidget {
  final GestureTapCallback? onTap;

  ContainerCard({super.key, required this.onTap});

  final ValueNotifier<bool> isExpandedNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: isExpandedNotifier,
      builder: (context, isExpanded, _) {
        return Container(
          width: responsiveHeight(context, 382),
          decoration: ShapeDecoration(
            color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.27),
            shape: RoundedRectangleBorder(
              // side: BorderSide(
              //   width: responsiveWidth(context, 0.50),
              //   color: theme.primaryColor,
              // ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Center(
            child: ExpansionTile(
              shape: Border(),
              backgroundColor: theme.colorScheme.primaryContainer,
              onExpansionChanged: (val) => isExpandedNotifier.value = val,
              trailing: SvgPicture.asset(
                isExpanded ? Svgs.arrow_up_circle : Svgs.arrow_down_circle,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                fit: BoxFit.contain,
              ),
              subtitle: Row(
                children: [
                  Text(
                    "(3) حاويات",
                    style: theme.textTheme.headlineLarge!.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(width: responsiveWidth(context, 8)),
                  Text("الموقع: صويلح"),
                ],
              ),
              title: Text(
                "الموقع (١)",
                style: theme.textTheme.labelLarge!.copyWith(fontSize: 12.sp),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 12),
                    vertical: responsiveHeight(context, 12),
                  ),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 13,
                        runSpacing: 13, // المسافة بين الصفوف
                        children: [
                          SizedBox(width: 150, child: ContainerCards()),
                          SizedBox(width: 150, child: ContainerCards()),
                          SizedBox(width: 150, child: ContainerCards()),
                          SizedBox(width: 150, child: ContainerCards()),
                        ],
                      ),
                      SizedBox(height: responsiveHeight(context, 13)),
                      CustomButton(
                        label: AppLocalizations.of(context)!.view_location,
                        onTap: () {},
                        buttonWidth: responsiveWidth(context, 335),
                        buttonHeights: responsiveHeight(context, 35),
                        textStyle: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(fontSize: 10.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
