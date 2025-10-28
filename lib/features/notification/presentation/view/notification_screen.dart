import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madinati/core/presentation/widgets/custom_app_bar.dart';
import 'package:madinati/features/notification/presentation/view/widget/notification_card.dart';

import '../../../../core/constants/svgs.dart';
import '../../../../core/presentation/app_bar/custom_appbar.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(label: AppLocalizations.of(context)!.notifications),

      body: Padding(
        padding: EdgeInsets.only(top: responsiveHeight(context, 42)),
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) {
            return SizedBox(height: responsiveHeight(context, 12));
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 24),
              ),
              child: InkWell(
                onTap: () {},
                child: NotificationCard(status: true),
              ),
            );
          },
        ),
      ),
    );
  }
}
