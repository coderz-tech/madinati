import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../locale/presentation/cubit/locale_cubit.dart';

class NoDataFoundText extends StatelessWidget {
  // final String msg;

  const NoDataFoundText({
    super.key,
    // required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.read<LocaleCubit>().getLabelById(id: 30),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF7E7F83),
        fontSize: 18.sp,
        fontFamily: 'AvenirArabic',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
