import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madinati/core/constants/svgs.dart';
import '../../../../../../core/utils/responsive.dart';
import 'widget/collapse_containers.dart';

class TripDetailsScreen extends StatelessWidget {
  final String tripName;

  const TripDetailsScreen({required this.tripName, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  tripName,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: responsiveHeight(context, 12));
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return ContainerCard(onTap: () {});
          },
        ),
      ),
    );
  }
}
