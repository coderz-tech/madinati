import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madinati/core/presentation/widgets/custom_button.dart';
import 'package:madinati/l10n/app_localizations.dart';

import '../../../../core/presentation/widgets/gradient_button.dart';
import '../../../../core/presentation/widgets/radio_button_with_text.dart';
import '../../../presentation/states/general_state.dart';
import '../../../presentation/widgets/loading_spinkit.dart';
import '../../domain/entities/local_model.dart';
import '../cubit/locale_cubit.dart';

class LangBottomSheet extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const LangBottomSheet({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context1) {
    Size size = MediaQuery.of(context1).size;
    return Container(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.05581395348,
        size.height * 0.05206073752,
        size.width * 0.05581395348,
        size.height * 0.05206073752,
      ),
      width: screenWidth,
      decoration: ShapeDecoration(
        color: Theme.of(context1).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: BlocBuilder<LocaleCubit, List<LocalModel>?>(
        builder: (context, localModel) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.select_language,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
              SizedBox(height: size.height * 0.02603036876),
              RadioButtonWidget(
                onTap: () {
                  context.read<LocaleCubit>().changeSelected(selectedIndex: 0);
                },
                isSelected: localModel![0].isSelected,
                name: localModel[0].name,
              ),
              SizedBox(height: size.height * 0.01301518438),
              RadioButtonWidget(
                onTap: () {
                  context.read<LocaleCubit>().changeSelected(selectedIndex: 1);
                },
                isSelected: localModel[1].isSelected,
                name: localModel[1].name,
              ),
              SizedBox(height: size.height * 0.01301518438),
              RadioButtonWidget(
                onTap: () {
                  context.read<LocaleCubit>().changeSelected(selectedIndex: 2);
                },
                isSelected: localModel[2].isSelected,
                name: localModel[2].name,
              ),
              SizedBox(height: size.height * 0.01301518438),
              RadioButtonWidget(
                onTap: () {
                  context.read<LocaleCubit>().changeSelected(selectedIndex: 3);
                },
                isSelected: localModel[3].isSelected,
                name: localModel[3].name,
              ),
              SizedBox(height: size.height * 0.02603036876),
              CustomButton(label: "تأكيد", onTap: (){})
              // BlocBuilder<AuthCubit, GeneralState>(
              //   builder: (context, state) {
              //     if (state is LoadingState) {
              //       return Container(
              //         alignment: Alignment.center,
              //         height: screenHeight * 0.06451612903,
              //         width: screenWidth,
              //         child: const LoadingSpinKit(),
              //       );
              //     } else {
              //       return IntrinsicHeight(
              //         child: GradientButton(
              //           text: AppLocalizations.of(context)!.confirm,
              //           onTap: () {
              //             context.read<LocaleCubit>().saveLocale();
              //
              //           },
              //           height: screenHeight * 0.06451612903,
              //           width: screenWidth,
              //         ),
              //       );
              //     }
              //   },
              // )
            ],
          );
        },
      ),
    );
  }
}
