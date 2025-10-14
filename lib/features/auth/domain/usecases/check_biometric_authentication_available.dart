import 'package:local_auth/local_auth.dart';

import '../repositories/biometric_repository.dart';

class CheckBiometricAuthenticationAvailable {
  final BiometricRepository repository;

  CheckBiometricAuthenticationAvailable(this.repository);

  Future<bool> call() async {
    bool biometricActive = await repository.getBiometricActive();
    if (!biometricActive) {
      bool canAuthenticate = await repository.canCheckBiometrics() ||
          await repository.isDeviceSupported();
      if (canAuthenticate) {
        List<BiometricType> list = await repository.getAvailableBiometrics();
        return list.isNotEmpty;
      }
    }
    return biometricActive;
  }
}
