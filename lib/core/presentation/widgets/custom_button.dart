import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madinati/core/constants/app_colors.dart';
import '../../utils/responsive.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final GestureTapCallback onTap;
  final String? icon; // Optional parameter for an SVG asset
  final Color? color; // Button background color
  final Color? iconColor; // Button background color
  final Color? borderColor; // Border color (optional)
  final double? borderWidth; // Optional parameter for border width
  final double? borderRadius; // Optional parameter for border radius
  final Color? labelColor; // Optional parameter for text color
  final double? iconSize; // Optional parameter for SVG icon size
  final double? buttonWidth;
  final double? buttonHeights;
  final TextStyle? textStyle; // New custom text style

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.color,
    this.iconColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.labelColor,
    this.iconSize,
    this.buttonWidth,
    this.buttonHeights,
    this.textStyle, // Custom text style
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle defaultStyle = TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.w700,
      color: labelColor ?? theme.colorScheme.onPrimary,
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius ?? 16),
      child: Container(
        constraints: BoxConstraints(
          // minWidth: buttonWidth ?? MediaQuery.of(context).size.width,
          minHeight: buttonHeights ?? responsiveHeight(context, 50),
        ),
        width: buttonWidth ?? MediaQuery.of(context).size.width,
        // height: buttonHeights ?? responsiveHeight(context, 50),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient ,
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          // border: Border.all(
            // color: borderColor ?? theme.colorScheme.primary,
            // width: borderWidth ?? 1.5,
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: responsiveWidth(context, 10),
                  top: responsiveHeight(context, 5),
                  bottom: responsiveHeight(context, 5),
                ),
                child: SvgPicture.asset(
                  color: iconColor,
                  icon!,
                  width: iconSize ?? responsiveWidth(context, 24),
                  height: iconSize ?? responsiveHeight(context, 24),
                  fit: BoxFit.contain,
                ),
              ),
              // const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                label,
                style:
                    textStyle ??
                    defaultStyle, // Prioritize textStyle if provided
              ),
            ),
          ],
        ),
      ),
    );
  }
}
