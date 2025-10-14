import '../repositories/biometric_repository.dart';

class CheckBiometricAuthenticationActive {
  final BiometricRepository repository;

  CheckBiometricAuthenticationActive(this.repository);

  Future<bool> call() async {
    return await repository.getBiometricActive();
  }
}
