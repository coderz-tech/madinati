import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madinati/l10n/app_localizations.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/gradient_button.dart';
import '../cubits/biometric_auth_cubit.dart';

class AskBiometricBottomSheet extends StatelessWidget {
  const AskBiometricBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.05581395348,
          (size.height * 0.47639484978) * 0.05144694533,
          size.width * 0.05581395348,
          (size.height * 0.47639484978) * 0.05144694533,
        ),
        width: size.width,
        height: size.height * 0.47588424437,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.04989604989),
            SvgPicture.asset("assets/images/face_id.svg"),
            SizedBox(height: size.height * 0.03326403326),
            Text(
              AppLocalizations.of(context)!
                  .save_your_biometric_login_for_future_logins,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacer(),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientButton(
                    text: AppLocalizations.of(context)!.yes,
                    onTap: () {
                      context
                          .read<BiometricAuthCubit>()
                          .setBiometricAuthenticationActive(isActive: true);
                      Navigator.pop(context);
                    },
                    height: size.height * 0.06237006237,
                    width: size.width * 0.43023255814,
                  ),
                  const SizedBox(width: 0.02790697674),
                  CustomButton(
                    label: AppLocalizations.of(context)!.no,
                    onTap: () {
                      context
                          .read<BiometricAuthCubit>()
                          .setBiometricAuthenticationActive(isActive: false);
                      Navigator.pop(context);
                    },
                    buttonHeights: size.height * 0.06237006237,
                    buttonWidth: size.width * 0.43023255814,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04989604989,
            ),
          ],
        ),
      ),
    );
  }
}
