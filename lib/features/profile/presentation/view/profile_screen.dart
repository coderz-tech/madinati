import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madinati/core/presentation/app_bar/custom_appbar.dart';
import 'package:madinati/core/presentation/widgets/custom_app_bar.dart';
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
      appBar: CustomAppbar(label: AppLocalizations.of(context)!.profile),
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
