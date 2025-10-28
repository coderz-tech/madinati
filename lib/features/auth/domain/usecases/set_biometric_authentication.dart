import '../repositories/biometric_repository.dart';

class SetBiometricAuthentication {
  final BiometricRepository repository;

  SetBiometricAuthentication(this.repository);

  call({required bool isActive}) async {
    return await repository.setBiometricActive(isActive);
  }
}
