import 'package:local_auth/local_auth.dart';

import '../../domain/repositories/biometric_repository.dart';
import '../datasources/biometric_local_data_source.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  final BiometricLocalDataSource localDataSource;

  BiometricRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> getBiometricActive() async {
    return await localDataSource.getBiometricActive();
  }

  @override
  setBiometricActive(bool isActive) {
    localDataSource.setBiometricActive(isActive);
  }

  @override
  Future<bool> canCheckBiometrics() async {
    return await localDataSource.canCheckBiometrics();
  }

  @override
  Future<bool> isDeviceSupported() async {
    return await localDataSource.isDeviceSupported();
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await localDataSource.getAvailableBiometrics();
  }

  @override
  Future<bool> authenticate({
    required String localizedReason,
    required String cancelButtonText,
  }) async {
    return await localDataSource.authenticate(
      localizedReason: localizedReason,
      cancelButtonText: cancelButtonText,
    );
  }
}
