import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/states/general_state.dart';
import '../../domain/usecases/authenticate_biometrics.dart';
import '../../domain/usecases/check_biometric_authentication_active.dart';
import '../../domain/usecases/check_biometric_authentication_available.dart';
import '../../domain/usecases/set_biometric_authentication.dart';
import '../states/check_biometric_authentication.dart';

class BiometricAuthCubit extends Cubit<GeneralState> {
  final CheckBiometricAuthenticationAvailable
      checkBiometricAuthenticationAvailable;
  final CheckBiometricAuthenticationActive checkBiometricAuthenticationActive;
  final SetBiometricAuthentication setBiometricAuthentication;
  final AuthenticateBiometrics authenticateBiometrics;

  BiometricAuthCubit({
    required this.checkBiometricAuthenticationActive,
    required this.setBiometricAuthentication,
    required this.checkBiometricAuthenticationAvailable,
    required this.authenticateBiometrics,
  }) : super(InitialState());

  checkIfBiometricAuthenticationAvailable() async {
    emit(
      CheckBiometricAuthenticationState(
        active: false,
        showDialogAsk: false,
      ),
    );

    final biometricCheckActiveResult =
        await checkBiometricAuthenticationActive();
    final biometricCheckAvailableResult =
        await checkBiometricAuthenticationAvailable();

    emit(
      CheckBiometricAuthenticationState(
        active: biometricCheckActiveResult,
        showDialogAsk: biometricCheckAvailableResult,
      ),
    );
  }

  setBiometricAuthenticationActive({required bool isActive}) async {
    await setBiometricAuthentication(isActive: isActive);

    emit(
      CheckBiometricAuthenticationState(
        active: isActive,
        showDialogAsk: false,
      ),
    );
  }

  Future<bool> biometricAuthentication({
    required String localizedReason,
    required String cancelButtonText,
  }) async {
    bool result = await authenticateBiometrics(
      localizedReason: localizedReason,
      cancelButtonText: cancelButtonText,
    );
    return result;
  }
}
