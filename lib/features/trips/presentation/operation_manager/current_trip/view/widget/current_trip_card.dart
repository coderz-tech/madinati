import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madinati/core/constants/svgs.dart';
import 'package:madinati/core/utils/responsive.dart';
import 'package:madinati/l10n/app_localizations.dart';

class CurrentTripCard extends StatelessWidget {
  const CurrentTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: responsiveWidth(context, 382),
      height: responsiveHeight(context, 309),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: responsiveWidth(context, 84),
            height: responsiveHeight(context, 27),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: theme.colorScheme.onPrimaryContainer.withValues(
                alpha: 0.16,
              ),
            ),
            child: Text(
              "رفع حاويات",
              style: theme.textTheme.displaySmall!.copyWith(fontSize: 12.sp),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.name_of_the_operational_plan,
            style: theme.textTheme.labelSmall,
          ),
          SizedBox(height: responsiveHeight(context, 10)),
          Text(
            "شارع الأمير محمد بن عبد العزيز",
            style: theme.textTheme.displayLarge!.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: responsiveHeight(context, 25)),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(Svgs.vehicle3)
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}
