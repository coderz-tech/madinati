import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/svgs.dart';
import '../../locale/presentation/cubit/locale_cubit.dart';
import '../widgets/gradient_button.dart';
import 'custom_button.dart';

class ErrorContainer extends StatelessWidget {
  final GestureTapCallback onTap;
  final String? msg;
  final String? buttonLabel;

  const ErrorContainer({
    super.key,
    required this.onTap,
    this.msg,
    this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.05581395348,
        (MediaQuery.of(context).size.height * 0.47639484978) * 0.05144694533,
        MediaQuery.of(context).size.width * 0.05581395348,
        (MediaQuery.of(context).size.height * 0.47639484978) * 0.05144694533,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          SvgPicture.asset(Svgs.wrong),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          Text(
            msg == null
                ? context.read<LocaleCubit>().getLabelById(id: 1005)
                : msg!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01663201663),
          CustomButton(
            label:
                buttonLabel == null
                    ? context.read<LocaleCubit>().getLabelById(id: 1006)
                    : buttonLabel!,
            onTap: onTap,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04989604989),
        ],
      ),
    );
  }
}
