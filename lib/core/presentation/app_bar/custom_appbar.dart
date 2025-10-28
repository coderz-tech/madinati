import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../l10n/app_localizations.dart';
import '../../constants/svgs.dart';
import '../../utils/responsive.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String label;
  final bool? showBackButton;

  const CustomAppbar({super.key, required this.label, this.showBackButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: responsiveWidth(context, 100),
      leading: Padding(
        padding: EdgeInsets.only(left: responsiveWidth(context, 24)),
        child: Row(
          children: [
            SvgPicture.asset(
              Svgs.global,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              fit: BoxFit.contain,
            ),
            SizedBox(width: responsiveWidth(context, 16)),
            SvgPicture.asset(
              Svgs.moon,
              width: responsiveWidth(context, 24),
              height: responsiveHeight(context, 24),
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: responsiveWidth(context, 24)),
          child: Row(
            children: [
              showBackButton ?? false ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),) : Container(),
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ],
      automaticallyImplyLeading: showBackButton ?? false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(thickness: 1, height: 1, color: Colors.grey.shade300),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
