import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/svgs.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../l10n/app_localizations.dart';

class ManualLiftingScreen extends StatelessWidget {
  const ManualLiftingScreen({super.key});

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
                  AppLocalizations.of(context)!.manual_assembly_attachments,
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
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 24),
          vertical: responsiveHeight(context, 27),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.sticker_chip_number,
              style: theme.textTheme.labelLarge!.copyWith(fontSize: 12.sp),
            ),
            Text(
              "132132132131232332",
              style: theme.textTheme.headlineLarge!.copyWith(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
