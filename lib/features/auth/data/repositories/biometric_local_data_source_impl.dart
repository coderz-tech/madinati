import 'package:local_auth/local_auth.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/secure_storage_helper.dart';
import '../datasources/biometric_local_data_source.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class BiometricLocalDataSourceImpl implements BiometricLocalDataSource {
  final LocalAuthentication localAuthentication;

  BiometricLocalDataSourceImpl({required this.localAuthentication});

  @override
  getBiometricActive() async {
    return SecureStorageHelper()
        .getPrefBool(key: AppConstants.BIOMETRICE_ACTIVE, defaultValue: false);
  }

  @override
  setBiometricActive(bool isActive) async {
    SecureStorageHelper().savePrefBool(
      key: AppConstants.BIOMETRICE_ACTIVE,
      value: isActive,
    );
  }

  @override
  Future<bool> canCheckBiometrics() async {
    return await localAuthentication.canCheckBiometrics;
  }

  @override
  Future<bool> isDeviceSupported() async {
    return await localAuthentication.isDeviceSupported();
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await localAuthentication.getAvailableBiometrics();
  }

  @override
  Future<bool> authenticate({
    required String localizedReason,
    required String cancelButtonText,
  }) async {
    return await localAuthentication.authenticate(
      localizedReason: localizedReason,
      authMessages: [
        AndroidAuthMessages(cancelButton: cancelButtonText),
        IOSAuthMessages(cancelButton: cancelButtonText),
      ],
    );
  }
}
