import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madinati/core/presentation/widgets/custom_button.dart';
import 'package:madinati/core/utils/responsive.dart';
import 'package:madinati/features/trips/presentation/driver/current_trip/view/widgets/trip_details.dart';
import 'package:madinati/features/trips/presentation/driver/current_trip/view/widgets/trip_information.dart';
import 'package:madinati/features/trips/presentation/driver/current_trip/view/widgets/trip_location.dart';
import 'package:madinati/features/trips/presentation/operation_manager/current_trip/view/widget/current_trip_card.dart';
import 'package:madinati/l10n/app_localizations.dart';

class OpmCurrentTripScreen extends StatelessWidget {
  const OpmCurrentTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return CurrentTripCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: 5,
      ),
    );
  }
}
