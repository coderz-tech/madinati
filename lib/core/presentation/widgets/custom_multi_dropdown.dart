import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../locale/presentation/cubit/locale_cubit.dart';
import '../../multiselect/src/multi_dropdown.dart';
import '../../utils/responsive.dart';

class CustomMultiDropdown<T extends Object> extends StatelessWidget {
  final List<DropdownItem<T>> items;
  final String title;
  final String hintText;
  final OnSelectionChanged<T>? onSelectionChange;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool? isEnabled;
  final bool singleSelect;
  final Color? svgcolor;

  const CustomMultiDropdown({
    super.key,
    required this.items,
    required this.title,
    required this.onSelectionChange,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.singleSelect = true,
    this.isEnabled = true,
    this.svgcolor, // Default is enabled (true)
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: theme.textTheme.headlineSmall!.copyWith(
          ),
        ),
        SizedBox(
          height: responsiveHeight(context, 12),
        ),
        AbsorbPointer(
          // Prevent interaction when not enabled
          absorbing: !isEnabled!,
          child: Container(
            child: MultiDropdown<T>(
              searchEnabled: true,
              closeOnBackButton: true,
              singleSelect: singleSelect,
              dropdownItemDecoration:  DropdownItemDecoration(
                backgroundColor: theme.colorScheme.background,
                textColor: theme.textTheme.headlineSmall!.color,
              ),
              dropdownDecoration: DropdownDecoration(
                borderRadius: BorderRadius.circular(12),
                backgroundColor: theme.colorScheme.background,
              ),
              fieldDecoration: FieldDecoration(
                prefixIcon: prefixIcon != null
                    ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    color: (svgcolor!=null)? svgcolor:null,
                    prefixIcon!,
                    width: responsiveWidth(context, 24),
                    height: responsiveHeight(context, 24),
                    fit: BoxFit.contain,
                  ),
                )
                    : null,
                suffixIcon: suffixIcon != null
                    ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    suffixIcon!,
                    width: screenWidth * 0.03604651,
                    height: screenHeight * 0.01305794,
                  ),
                )
                    : null,
                showClearIcon: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    width: 1.5,
                    color: Color(0xFFE6EBF2),
                  ),
                ),
                hintStyle: theme.textTheme.labelSmall,
                hintText: hintText,
              ),
              items: items,
              searchDecoration: SearchFieldDecoration(
                hintText: context.read<LocaleCubit>().getLabelById(id:1003),
                searchIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              onSelectionChange: onSelectionChange,
            ),
          ),
        ),
      ],
    );
  }
}
