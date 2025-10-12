import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madinati/features/operation_plans/presentation/driver/operation_plan_details/view/widget/operation_plan_information.dart';
import 'package:madinati/features/operation_plans/presentation/driver/operation_plan_details/view/widget/operation_plans_details.dart';
import 'package:madinati/features/operation_plans/presentation/driver/operation_plan_details/view/widget/operation_plans_location.dart';
import 'package:madinati/l10n/app_localizations.dart';

import '../../../../../../core/constants/svgs.dart';
import '../../../../../../core/presentation/widgets/custom_button.dart';
import '../../../../../../core/utils/responsive.dart';
import '../../../../../trips/presentation/driver/trip_containers_list/trip_details_screen.dart';

class OperationPlansDetailsScreen extends StatelessWidget {
  const OperationPlansDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.only(left: responsiveWidth(context, 24)),
          child: Row(
            children: [
              Transform.rotate(
                angle: Directionality.of(context) == TextDirection.rtl
                    ? 0
                    : 3.14, // π = 180°
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(Svgs.back),
                ),
              ),
              SizedBox(width: responsiveWidth(context, 12)),
              Expanded(
                child: Text(
                  /// todo trip name
                  AppLocalizations.of(context)!.operational_plan_details,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(thickness: 1, height: 1, color: Colors.grey.shade300),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsiveHeight(context, 27)),
            Text(
              AppLocalizations.of(context)!.name_of_the_operational_plan,
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(fontSize: 12.sp),
            ),
            SizedBox(width: responsiveWidth(context, 4)),
            Text(
              "اسم الخطة التشغيلية هنا",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: responsiveHeight(context, 26)),
            OperationPlanInformation(),
            SizedBox(height: responsiveHeight(context, 12)),
            OperationPlansDetails(),
            SizedBox(height: responsiveHeight(context, 12)),
            OperationPlansLocation(),
            SizedBox(height: responsiveHeight(context, 12)),
            CustomButton(
              buttonHeights: responsiveHeight(context, 60),
              buttonWidth: responsiveWidth(context, 382),
              label: "عرض الرحلة",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TripDetailsScreen(tripName: "test trip"),
                  ),
                );
              },
            ),
            SizedBox(height: responsiveHeight(context, 12)),
          ],
        ),
      ),
    );
  }
}
