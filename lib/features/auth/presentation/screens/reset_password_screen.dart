import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/svgs.dart';
import '../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../../../core/utils/responsive.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: responsiveHeight(context, 60),
        iconTheme: Theme.of(context).appBarTheme.iconTheme!.copyWith(size: 18.sp),

        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(context.read<LocaleCubit>().getLabelById(id: 1024)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: responsiveHeight(context, 91)),
              Text(
                context.read<LocaleCubit>().getLabelById(id: 1025),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: responsiveHeight(context, 27)),
              CustomTextField(
                prefixIcon: Svgs.lock,
                labelText: context.read<LocaleCubit>().getLabelById(id: 1010),
                hintText: context.read<LocaleCubit>().getLabelById(id: 1010),
                isPassword: true,
                maxLines: 1,
                maxLength: 65,
                inputType: TextInputType.text,
              ),
              SizedBox(height: responsiveHeight(context, 13)),
              CustomTextField(
                prefixIcon: Svgs.lock,
                labelText: context.read<LocaleCubit>().getLabelById(id: 1026),
                hintText: context.read<LocaleCubit>().getLabelById(id: 1026),
                isPassword: true,
                maxLines: 1,
                maxLength: 65,
                inputType: TextInputType.text,
              ),
              SizedBox(height: responsiveHeight(context, 65)),
              CustomButton(
                label: context.read<LocaleCubit>().getLabelById(id: 1027),
                onTap: () {
                  /// TODO Reset Password
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
