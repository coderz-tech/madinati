import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/constants/svgs.dart';
import '../../../../../../../core/utils/responsive.dart';
import '../../../../../../../l10n/app_localizations.dart';

class OperationPlanCard extends StatelessWidget {
  const OperationPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWidth(context, 382),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.onPrimaryContainer.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: responsiveWidth(context, 16),
          vertical: responsiveHeight(context, 16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.name_of_the_operational_plan,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontSize: 12.sp),
            ),
            Text(
              "اسم الخطة التشغيلية هنا",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: responsiveHeight(context, 22)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Svgs.vehicle),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text(
                      AppLocalizations.of(context)!.vehicle,
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                Text(
                  "نوع المركبة (58816-14)",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Svgs.box),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text(
                      AppLocalizations.of(context)!.wasteType,
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                Text(
                  "تجاري",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Svgs.gps),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text(
                      AppLocalizations.of(context)!.tracking_company,
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                Text(
                  "الشركة المتحدة للتتبع",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
