import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../locale/presentation/cubit/locale_cubit.dart';
import '../../utils/responsive.dart';
import '../widgets/custom_button.dart';

class MsgBottomSheet extends StatelessWidget {
  final String msg;
  final String title;
  final String imagePath;

  const MsgBottomSheet({
    super.key,
    required this.msg,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 24),
        vertical: responsiveHeight(context, 24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(imagePath,
            width: responsiveWidth(context, 42),
            height: responsiveHeight(context, 42),
            fit: BoxFit.contain,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            msg,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03326403326),
          IntrinsicHeight(
            child: CustomButton(
              label: context.read<LocaleCubit>().getLabelById(id: 1004),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
