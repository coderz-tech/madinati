import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madinati/core/constants/svgs.dart';
import 'package:madinati/core/utils/responsive.dart';

import '../../../../../../../l10n/app_localizations.dart';

class TripLocation extends StatelessWidget {
  const TripLocation({super.key});

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
              children: [
                SvgPicture.asset(Svgs.routeSquare),
                SizedBox(width: responsiveWidth(context, 4)),
                Text(
                  AppLocalizations.of(context)!.location,
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 10)),
            Container(
              height: responsiveHeight(context, 124),
              width: responsiveWidth(context, 350),
              child: SizedBox(
                height: responsiveHeight(context, 124),
                width: responsiveWidth(context, 350),

              ),
            )

          ],
        ),
      ),
    );
  }
}
