import 'package:flutter/material.dart';
import 'package:madinati/core/presentation/app_bar/custom_appbar.dart';
import 'package:madinati/core/utils/responsive.dart';
import 'package:madinati/features/violations/presentation/monitor_manager/view/violations_screen.dart';
import 'package:madinati/features/violations/presentation/monitor_manager/view/widget/violation_type_container.dart';
import 'package:madinati/features/violations/presentation/monitor_manager/view/widget/violations_bottom_sheet.dart';

import '../../../../../core/constants/svgs.dart';
import '../../../../../l10n/app_localizations.dart';

class ViolationMainScreen extends StatelessWidget {
  const ViolationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(label: AppLocalizations.of(context)!.violations),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: responsiveHeight(context, 64),
          horizontal: responsiveWidth(context, 24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ViolationTypeContainer(
                  label: AppLocalizations.of(
                    context,
                  )!.violation_reference_number,
                  svg: Svgs.unselectedReceiptItem,
                  onPressed: (){
                    showReferenceNumberSheet(
                      context,
                      title: AppLocalizations.of(context)!.violation_reference_number,
                      onSubmit: (ref) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViolationsScreen(),));
                        debugPrint("Reference Number: $ref");
                      },
                    );
                  },
                ),
                ViolationTypeContainer(
                  label: AppLocalizations.of(
                    context,
                  )!.violation_reference_number,
                  svg: Svgs.unselectedReceiptItem,
                  onPressed: (){},

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
