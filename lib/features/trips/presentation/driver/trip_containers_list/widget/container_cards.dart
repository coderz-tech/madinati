import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madinati/core/constants/svgs.dart';
import 'package:madinati/core/utils/responsive.dart';
import '../../../../../../../l10n/app_localizations.dart';

class ContainerCards extends StatelessWidget {
  const ContainerCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWidth(context, 161),
      // height: responsiveHeight(context, 131),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          strokeAlign: 1,
        ),
        borderRadius: BorderRadius.circular(14.sp),
      ),
      child: Column(
        children: [
          SizedBox(height: responsiveHeight(context, 6)),
          Text(
            AppLocalizations.of(context)!.chip_number,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(fontSize: 10.sp),
          ),
          SizedBox(height: responsiveHeight(context, 4)),
          Container(
            width: responsiveWidth(context, 141),
            height: responsiveHeight(context, 19),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.sp),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              "112321321321321323",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontSize: 12.sp),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.type,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(fontSize: 10.sp),
                  ),
                  Text(
                    "2 ياردة",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.size,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(fontSize: 10.sp),
                  ),
                  Text(
                    "370 Tons",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: responsiveHeight(context, 14)),
          SizedBox(width: responsiveWidth(context, 140), child: Divider()),
          SizedBox(height: responsiveHeight(context, 8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Svgs.vehicle3),
              SizedBox(width: responsiveWidth(context, 8.89)),
              Text(
                "ممتلئة - يدوي",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(fontSize: 10.sp),
              ),
            ],
          ),
          SizedBox(height: responsiveHeight(context, 11)),
        ],
      ),
    );
  }
}
