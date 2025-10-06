import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/svgs.dart';
import '../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../../../core/utils/responsive.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: responsiveHeight(context, 60),
        iconTheme: Theme.of(context).appBarTheme.iconTheme!.copyWith(size: 18.sp),
        title: Text(context.read<LocaleCubit>().getLabelById(id: 1015)),
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
              SizedBox(height: responsiveHeight(context, 66)),
              Center(
                child: SizedBox(
                  width: responsiveWidth(context, 301),
                  child: Text(
                    context.read<LocaleCubit>().getLabelById(id: 1016),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(height: responsiveHeight(context, 41)),
              CustomTextField(
                controller: phoneNumberController,
                hintText: context.read<LocaleCubit>().getLabelById(id: 1018),
                labelText: context.read<LocaleCubit>().getLabelById(id: 1084),

                prefixIcon: Svgs.phone,
                maxLines: 1,
                maxLength: 254,
                inputType: TextInputType.number,
              ),
              SizedBox(height: responsiveHeight(context, 57)),
              CustomButton(
                label: context.read<LocaleCubit>().getLabelById(id: 1019),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
