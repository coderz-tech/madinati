import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/pngs.dart';
import '../../../constants/svgs.dart';
import '../../../presentation/widgets/custom_button.dart';
import '../../../utils/responsive.dart';
import '../cubit/locale_cubit.dart';
import '../state/locale_state.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocaleCubit>().loadSavedLocale();
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
      width: responsiveWidth(context, 430),
      height: responsiveHeight(context, 500),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: responsiveHeight(context, 48)),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: responsiveWidth(context, 24),
                ),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    context.read<LocaleCubit>().getLabelById(id: 1000),
                    // Use key for localization
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: responsiveHeight(context, 27)),
              LanguageOption(
                onTap: () {
                  context.read<LocaleCubit>().changeSelected(selectedIndex: 1);
                },
                isSelected: state.listLocal[1].isSelected,
                name: state.listLocal[1].name,
                picture: Pngs.ksa,
              ),
              SizedBox(height: responsiveHeight(context, 15)),
              LanguageOption(
                picture: Pngs.uk,
                onTap: () {
                  context.read<LocaleCubit>().changeSelected(selectedIndex: 0);
                },
                isSelected: state.listLocal[0].isSelected,
                name: state.listLocal[0].name,
              ),
              SizedBox(height: responsiveHeight(context, 15)),
              LanguageOption(
                picture: Pngs.urdu,
                onTap: () {
                  context.read<LocaleCubit>().changeSelected(selectedIndex: 2);
                },
                isSelected: state.listLocal[2].isSelected,
                name: state.listLocal[2].name,
              ),
              SizedBox(height: responsiveHeight(context, 15)),
              LanguageOption(
                picture: Pngs.hind,
                onTap: () {
                  context.read<LocaleCubit>().changeSelected(selectedIndex: 3);
                },
                isSelected: state.listLocal[3].isSelected,
                name: state.listLocal[3].name,
              ),
              SizedBox(height: responsiveHeight(context, 28)),
              CustomButton(
                label: context.read<LocaleCubit>().getLabelById(id: 1001),
                onTap: () {
                  context.read<LocaleCubit>().saveLocale().then((value) {
                    Navigator.pop(context);
                  });
                },
                // buttonHeights: screenHeight * 0.06451612903,
                // buttonWidth: screenWidth,
              ),
              SizedBox(height: responsiveHeight(context, 30)),
            ],
          );
        },
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String name;
  final String picture;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageOption({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
    required this.picture,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: responsiveWidth(context, 382),
        height: responsiveHeight(context, 52),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color:
                  isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: responsiveWidth(context, 20),
              ),
              child: Container(
                width: responsiveWidth(context, 25),
                height: responsiveHeight(context, 25),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  picture,
                  width: responsiveWidth(context, 24),
                  height: responsiveHeight(context, 24),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
              ),
              child: Text(
                name,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 12.sp),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: responsiveWidth(context, 10),
              ),
              child:
                  isSelected
                      ? SvgPicture.asset(
                        Svgs.tick,
                        width: responsiveWidth(context, 42),
                        height: responsiveHeight(context, 42),
                        fit: BoxFit.contain,
                      )
                      : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
