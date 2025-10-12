import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/svgs.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: responsiveWidth(context, 100),
        leading: Padding(
          padding: EdgeInsets.only(left: responsiveWidth(context, 24)),
          child: Row(
            children: [
              SvgPicture.asset(
                Svgs.global,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                fit: BoxFit.contain,
              ),
              SizedBox(width: responsiveWidth(context, 16)),
              SvgPicture.asset(
                Svgs.moon,
                width: responsiveWidth(context, 24),
                height: responsiveHeight(context, 24),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: responsiveWidth(context, 24)),
            child: Text(
              AppLocalizations.of(context)!.profile,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 20.sp),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(thickness: 1, height: 1, color: Colors.grey.shade300),
        ),
      ),

    );
  }
}
