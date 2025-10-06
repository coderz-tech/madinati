import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/pngs.dart';
import '../../../constants/svgs.dart';
import '../../../presentation/cubits/sheet_cubit.dart';
import '../../../presentation/states/sheet_state.dart';
import '../../domain/entities/local_entity.dart';
import '../../../utils/responsive.dart';
import '../bottom_sheet/lang_bottom_sheet.dart';
import '../cubit/locale_cubit.dart';
import '../state/locale_state.dart';

class LanguageSelectionButton extends StatelessWidget {
  const LanguageSelectionButton({super.key});

  String _getFlagByCode(String code) {
    switch (code) {
      case 'ar':
        return Pngs.ksa;
      case 'en':
        return Pngs.uk;
      case 'ur':
        return Pngs.urdu;
      case 'hi':
        return Pngs.hind;
      default:
        return Pngs.ksa; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsetsDirectional.only(end: responsiveWidth(context, 10)),
      child: InkWell(
        onTap: () {
          context.read<SheetCubit>().openSheet();
          showModalBottomSheet(
            constraints: BoxConstraints(
              minWidth: responsiveWidth(context, 440),
            ),
            context: context,
            isScrollControlled: true,
            builder: (context) => const LangBottomSheet(),
          ).then((_) {
            context.read<SheetCubit>().closeSheet();
            context.read<LocaleCubit>().resetSelectedLocale();
          });
        },
        child: Container(
          constraints: BoxConstraints(minWidth: responsiveWidth(context, 40)),
          height: responsiveHeight(context, 30),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: responsiveWidth(context, 5),
                ),
                child: BlocBuilder<SheetCubit, SheetState>(
                  builder: (context, state) {
                    final isOpen = state is SheetOpened;
                    return SvgPicture.asset(
                      isOpen ? Svgs.arrowUp : Svgs.arrowDown,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                      width: responsiveWidth(context, 24),
                      height: responsiveHeight(context, 24),
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              BlocBuilder<LocaleCubit, LocaleState>(
                builder: (context, state) {
                  final selected = state.listLocal.firstWhere(
                    (locale) => locale.isSelected,
                    orElse: () => state.listLocal.first,
                  );

                  final flagAsset = _getFlagByCode(selected.code);
                  return Image.asset(
                    flagAsset,
                    width: responsiveWidth(context, 24),
                    height: responsiveHeight(context, 24),
                    fit: BoxFit.contain,
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
