import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/svgs.dart';
import '../../utils/responsive.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String hintText;
  final String? prefixIcon;
  final TextEditingController? controller;
  final String? suffixIcon;
  final bool isPassword;
  final TextInputType? inputType;
  final bool? enableField;
  final int? maxLines;
  final int? maxLength;
  final double? width;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final Color? prefixColor;
  final Color? suffixSvgColor;
  final Color? disabledBorderColor;
  final double? containerWidth;
  final double? containerHeight;
  final AutovalidateMode? autoValidateMode;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.labelText,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.inputType,
    this.enableField,
    this.maxLines,
    this.width,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.maxLength,
    this.onChanged,
    this.prefixColor,
    this.containerWidth,
    this.containerHeight,
    this.autoValidateMode,
    this.inputFormatters,
    this.suffixSvgColor,
    this.disabledBorderColor,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: responsiveWidth(context, 14),
            ),
            child: Text(
              widget.labelText!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: responsiveHeight(context, 6)),
        ],
        SizedBox(
          width: widget.width ?? responsiveWidth(context, 440),
          child: SizedBox(
            width: widget.containerWidth,
            height: widget.containerHeight,
            child: TextFormField(
              inputFormatters: widget.inputFormatters,
              autovalidateMode:
                  widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
              onChanged: widget.onChanged,
              maxLength: widget.maxLength ?? 65,
              cursorHeight: responsiveHeight(context, 25),
              cursorColor: Theme.of(context).colorScheme.primary,
              style: Theme.of(context).textTheme.headlineSmall,
              enabled: widget.enableField,
              keyboardType: widget.inputType,
              textAlign: TextAlign.start,
              controller: widget.controller,
              obscureText: _isObscured,
              maxLines: widget.isPassword ? 1 : widget.maxLines,
              validator: widget.validator,
              textAlignVertical: TextAlignVertical.center,
              readOnly: widget.readOnly ?? false,
              onTap: widget.onTap,
              decoration: InputDecoration(
                counterText: "",
                prefixIcon:
                    widget.prefixIcon != null
                        ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(context, 12),
                            vertical: responsiveHeight(context, 12),
                          ),
                          child: SvgPicture.asset(
                            widget.prefixIcon!,
                            colorFilter: ColorFilter.mode(
                              widget.prefixColor ??
                                  Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn,
                            ),
                            width: responsiveWidth(context, 24),
                            height: responsiveHeight(context, 24),
                            fit: BoxFit.contain,
                          ),
                        )
                        : null,
                suffixIcon:
                    widget.suffixIcon != null || widget.isPassword
                        ? GestureDetector(
                          onTap: widget.isPassword ? _toggleObscureText : null,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: responsiveWidth(context, 12),
                              vertical: responsiveHeight(context, 12),
                            ),
                            child: SvgPicture.asset(
                              widget.isPassword
                                  ? (_isObscured ? Svgs.show : Svgs.hide)
                                  : widget.suffixIcon!,
                              colorFilter: ColorFilter.mode(
                                widget.suffixSvgColor ??
                                    Theme.of(context).iconTheme.color!,
                                BlendMode.srcIn,
                              ),
                              width: responsiveWidth(context, 24),
                              height: responsiveHeight(context, 24),
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                        : Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(context, 12),
                            vertical: responsiveHeight(context, 12),
                          ),
                          child: SizedBox(
                            width: responsiveWidth(context, 24),
                            height: responsiveHeight(context, 24),
                          ),
                        ),
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.labelSmall,
                contentPadding: EdgeInsetsDirectional.only(
                  start: responsiveWidth(context, 15),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color:
                        widget.disabledBorderColor ??
                        Theme.of(context).colorScheme.outline,
                    width: responsiveWidth(context, 0.5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: responsiveWidth(context, 0.5),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                    width: responsiveWidth(context, 1),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                    width: responsiveWidth(context, 1),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.12),
                    width: responsiveWidth(context, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: responsiveWidth(context, 1),
                  ),
                ),
                errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
