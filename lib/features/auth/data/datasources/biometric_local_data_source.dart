import 'package:local_auth/local_auth.dart';

abstract class BiometricLocalDataSource {
  Future<bool> getBiometricActive();

  setBiometricActive(bool isActive);

  Future<bool> canCheckBiometrics();

  Future<bool> isDeviceSupported();

  Future<List<BiometricType>> getAvailableBiometrics();

  Future<bool> authenticate({
    required String localizedReason,
    required String cancelButtonText,
  });
}
