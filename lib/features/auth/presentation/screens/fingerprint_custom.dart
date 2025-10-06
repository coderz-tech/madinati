import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/svgs.dart';
import '../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../cubits/refresh_token_cubit.dart';

class FingerprintButton extends StatelessWidget {
  const FingerprintButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<RefreshTokenCubit>().refreshToken(
          localizedReason: context.read<LocaleCubit>().getLabelById(id: 1173),
          errorMsg: context.read<LocaleCubit>().getLabelById(id: 1153),
        );
      },
      child: SvgPicture.asset(
        Svgs.fingerprint,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
