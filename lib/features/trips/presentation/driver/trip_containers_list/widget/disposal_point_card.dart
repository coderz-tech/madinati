import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madinati/l10n/app_localizations.dart';

import '../../../../../../core/utils/responsive.dart';

class DisposalPointCard extends StatelessWidget {
  const DisposalPointCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: responsiveHeight(context, 382),
      decoration: ShapeDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          // side: BorderSide(
          //   width: responsiveWidth(context, 0.50),
          //   color: theme.primaryColor,
          // ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 16),
        vertical: responsiveHeight(context, 16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.disposal_point,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 12.sp,
              color: Theme.of(
                context,
              ).textTheme.titleLarge!.color?.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 4)),
          Row(
            children: [
              Text(
                "اسم نقطة التخلص",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontSize: 18.sp),
              ),
              SizedBox(width: responsiveWidth(context, 8)),
              Text(
                "${AppLocalizations.of(context)!.location}: صويلح",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontSize: 14.sp),
              ),
              SizedBox(width: responsiveWidth(context, 4)),
              Container(
                width: responsiveWidth(context, 71),
                height: responsiveHeight(context, 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 8),vertical: responsiveHeight(context, 2)),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.view_location,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.copyWith(fontSize: 10.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
