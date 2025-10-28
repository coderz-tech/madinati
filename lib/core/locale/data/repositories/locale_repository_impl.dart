import 'dart:io';

import '../../../../core/constants/app_constants.dart';
import '../../../utils/secure_storage_helper.dart';
import '../../domain/repositories/locale_repository.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  @override
  saveLocale({required String code}) async {
    await SecureStorageHelper().savePrefString(
      key: AppConstants.LANGUAGE_CODE,
      value: code,
    );
  }

  @override
  Future<String> loadSavedLocale() async {
    return await SecureStorageHelper().getPrefString(
      key: AppConstants.LANGUAGE_CODE,
      defaultValue: Platform.localeName.split('_').first,
    );
  }
}
