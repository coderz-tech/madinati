import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madinati/core/presentation/widgets/custom_button.dart';
import 'package:madinati/core/presentation/widgets/custom_textfield.dart';

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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 24),
            vertical: responsiveHeight(context, 24),
          ),
          child: Column(
            children: [
              CustomTextField(
                hintText: "اسم السائق يكتب هنا",
                labelText: AppLocalizations.of(context)!.drivers_name,
              ),
              SizedBox(height: responsiveHeight(context, 16)),
              CustomTextField(
                hintText: "رقم الهوية/الإقامة يكتب هنا",
                labelText: AppLocalizations.of(context)!.identity_residency_number,
              ),
              SizedBox(height: responsiveHeight(context, 16)),
              CustomTextField(
                hintText: "1992/12/10",
                labelText: AppLocalizations.of(context)!.dob,
              ),
              SizedBox(height: responsiveHeight(context, 16)),
              CustomTextField(
                hintText: "جنسية السائق تكتب هنا",
                labelText: AppLocalizations.of(context)!.nationality,
              ),
              SizedBox(height: responsiveHeight(context, 16)),
              CustomTextField(
                hintText: "+966 011 XXX XXXX",
                labelText: AppLocalizations.of(context)!.phone_number,
              ),
              Spacer(),
              CustomButton(label: AppLocalizations.of(context)!.logout, onTap: (){},color: Theme.of(context).colorScheme.onError,)
            ],
          ),
        ),
      ),
    );
  }
}
