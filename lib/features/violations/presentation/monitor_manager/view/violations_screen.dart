import 'package:flutter/material.dart';

import '../../../../../core/presentation/app_bar/custom_appbar.dart';
import '../../../../../l10n/app_localizations.dart';

class ViolationsScreen extends StatelessWidget {
  const ViolationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(label: AppLocalizations.of(context)!.violations,showBackButton: true,),

    );
  }
}
