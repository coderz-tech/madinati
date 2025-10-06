import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/svgs.dart';
import '../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../../../core/utils/responsive.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: responsiveHeight(context, 60),
        iconTheme: Theme.of(context).appBarTheme.iconTheme!.copyWith(size: 18.sp),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          context.read<LocaleCubit>().getLabelById(id: 1119),
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: responsiveHeight(context, 50)),
              Text(
                context.read<LocaleCubit>().getLabelById(id: 1025),
                style: theme.textTheme.labelMedium,
              ),
              SizedBox(height: responsiveHeight(context, 25)),
              CustomTextField(
                prefixIcon: Svgs.lock,
                isPassword: true,
                labelText: context.read<LocaleCubit>().getLabelById(id: 1132),
                hintText: context.read<LocaleCubit>().getLabelById(id: 1010),
              ),
              SizedBox(height: responsiveHeight(context, 11)),
              CustomTextField(
                prefixIcon: Svgs.lock,
                isPassword: true,
                labelText: context.read<LocaleCubit>().getLabelById(id: 1132),
                hintText: context.read<LocaleCubit>().getLabelById(id: 1010),
              ),
              SizedBox(height: responsiveHeight(context, 11)),
              CustomTextField(
                prefixIcon: Svgs.lock,
                isPassword: true,
                labelText: context.read<LocaleCubit>().getLabelById(id: 1134),
                hintText: context.read<LocaleCubit>().getLabelById(id: 1026),
              ),
              SizedBox(height: responsiveHeight(context, 52)),
              CustomButton(
                  label: context.read<LocaleCubit>().getLabelById(id: 1135),
                  onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
