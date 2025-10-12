import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madinati/core/presentation/widgets/custom_button.dart';
import 'package:madinati/core/utils/responsive.dart';
import 'package:madinati/features/trips/presentation/driver/upcoming_trip/view/widgets/trip_details.dart';
import 'package:madinati/features/trips/presentation/driver/upcoming_trip/view/widgets/trip_information.dart';
import 'package:madinati/features/trips/presentation/driver/upcoming_trip/view/widgets/trip_location.dart';
import 'package:madinati/l10n/app_localizations.dart';

import '../../trip_containers_list/trip_details_screen.dart';

class UpcomingTripScreen extends StatelessWidget {
  const UpcomingTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            SizedBox(height: responsiveHeight(context, 26),),
            TripInformation(),
            SizedBox(height: responsiveHeight(context, 12),),
            TripDetails(),
            SizedBox(height: responsiveHeight(context, 12),),
            TripLocation(),
            SizedBox(height: responsiveHeight(context, 12),),
            CustomButton(label: "عرض الرحلة", onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TripDetailsScreen(
                    tripName: "test trip",
                  ),
                ),
              );
            }),
            SizedBox(height: responsiveHeight(context, 12),),

          ],
        ),
      ),
    );
  }
}
