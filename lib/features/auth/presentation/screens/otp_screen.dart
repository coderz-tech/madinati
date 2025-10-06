import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/utils/responsive.dart';
import 'reset_password_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: responsiveHeight(context, 60),
        iconTheme: Theme.of(context).appBarTheme.iconTheme!.copyWith(size: 18.sp),
        title: Text(context.read<LocaleCubit>().getLabelById(id: 1020)),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: responsiveHeight(context, 75)),
              Center(
                child: SizedBox(
                  width: responsiveWidth(context, 257),
                  child: Text(
                    context.read<LocaleCubit>().getLabelById(id: 1021),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(height: responsiveHeight(context, 46)),
              OtpTextField(
                alignment: Alignment.center,
                showCursor: false,
                textStyle:
                Theme.of(context).textTheme.bodyLarge,
                focusedBorderColor: theme.colorScheme.primary,
                borderColor: theme.colorScheme.tertiaryContainer,
                fillColor: theme.colorScheme.tertiaryContainer,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                numberOfFields: 5,
                fieldWidth: responsiveWidth(context, 65),
                fieldHeight: responsiveWidth(context, 65),
                borderRadius: BorderRadius.circular(16),
                filled: true,
                showFieldAsBox: true,
                keyboardType: TextInputType.number,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {},
              ),
              SizedBox(height: responsiveHeight(context, 68)),
              CustomButton(
                label: context.read<LocaleCubit>().getLabelById(id: 1019),
                onTap: () {
                  /// TODO verify
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: responsiveHeight(context, 300)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${context.read<LocaleCubit>().getLabelById(id: 1022)} ",
                      style: theme.textTheme.labelMedium,
                    ),
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              /// TODO resend
                            },
                      text: context.read<LocaleCubit>().getLabelById(id: 1023),
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
