import '../repositories/biometric_repository.dart';

class AuthenticateBiometrics {
  final BiometricRepository repository;

  AuthenticateBiometrics(this.repository);

  Future<bool> call({
    required String localizedReason,
    required String cancelButtonText,
  }) async {
    final bool didAuthenticate = await repository.authenticate(
      localizedReason: localizedReason,
      cancelButtonText: cancelButtonText,
    );
    return didAuthenticate;
  }
}
