import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madinati/core/constants/svgs.dart';
import 'package:madinati/core/utils/responsive.dart';

import '../../../../../../../l10n/app_localizations.dart';

class OperationPlansDetails extends StatelessWidget {
  const OperationPlansDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: responsiveHeight(context, 122),
      width: responsiveWidth(context, 382),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.onPrimaryContainer.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 16),
          vertical: responsiveHeight(context, 16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Svgs.clock),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text(
                      AppLocalizations.of(context)!.actual_start_time,
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                Text(
                  "1:00 PM",
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
                    SvgPicture.asset(Svgs.location),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text(
                      AppLocalizations.of(context)!.starting_point,
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                Text(
                  "اسم منطقة نقطة الانطلاق",
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
                    SvgPicture.asset(Svgs.locationTick),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text(
                      AppLocalizations.of(context)!.disposal_point,
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                Text(
                  "اسم منطقة نقطة الانطلاق",
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
