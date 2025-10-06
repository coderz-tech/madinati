import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/secure_storage_helper.dart';

abstract class ThemeLocalDataSource {
  Future<bool> getIsDarkTheme();

  setIsDarkTheme({required bool isDarkTheme});
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  @override
  Future<bool> getIsDarkTheme() async {
    return await SecureStorageHelper().getPrefBool(
      key: AppConstants.IS_DARK_THEME,
      defaultValue: false,
    );
  }

  @override
  setIsDarkTheme({required bool isDarkTheme}) async {
    await SecureStorageHelper().savePrefBool(
      key: AppConstants.IS_DARK_THEME,
      value: isDarkTheme,
    );
  }
}
