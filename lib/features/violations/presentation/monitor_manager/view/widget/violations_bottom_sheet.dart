import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madinati/core/presentation/widgets/custom_button.dart';
import 'package:madinati/core/presentation/widgets/custom_textfield.dart';
import 'package:madinati/core/utils/responsive.dart';
import 'package:madinati/l10n/app_localizations.dart';

Future<void> showReferenceNumberSheet(
  BuildContext context, {
  required void Function(String reference) onSubmit,
  required String title,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).colorScheme.onPrimary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => ViolationsBottomSheet(title: title, onSubmit: onSubmit),
  );
}

class ViolationsBottomSheet extends StatefulWidget {
  final String title;
  final void Function(String) onSubmit;

  const ViolationsBottomSheet({
    super.key,
    required this.title,
    required this.onSubmit,
  });

  @override
  State<ViolationsBottomSheet> createState() => _ViolationsBottomSheetState();
}

class _ViolationsBottomSheetState extends State<ViolationsBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop();
      widget.onSubmit(_controller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return SafeArea(
      // top: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 24),
          vertical: responsiveHeight(context, 48),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              widget.title,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 20.sp),
              // textAlign: TextAlign.start,
            ),
            SizedBox(height: responsiveHeight(context, 24)),

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    hintText: AppLocalizations.of(
                      context,
                    )!.violation_reference_number,
                    labelText: AppLocalizations.of(
                      context,
                    )!.violation_reference_number,
                    controller: _controller,
                  ),

                  SizedBox(height: responsiveHeight(context, 24)),
                  CustomButton(
                    label: AppLocalizations.of(context)!.inquiry,
                    onTap: _handleSubmit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
