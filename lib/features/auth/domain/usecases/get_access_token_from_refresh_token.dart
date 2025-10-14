import 'package:flutter_appauth/flutter_appauth.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/secure_storage_helper.dart';

class GetAccessTokenFromRefreshToken {
  final FlutterAppAuth appAuth;

  GetAccessTokenFromRefreshToken({required this.appAuth});

  @override
  Future<TokenResponse?> nullableCall() async {
    List<String> scopesList = AppConstants.scopes.split(',');

    return await appAuth.token(
      TokenRequest(
        AppConstants.clintID,
        "${AppConstants.appAuthRedirectScheme}://${AppConstants.appAuthRedirectHost}",
        discoveryUrl: AppConstants.discoveryUrl,
        refreshToken: await SecureStorageHelper().getPrefString(
          key: AppConstants.REFRESH_TOKEN,
          defaultValue: "",
        ),
        scopes: scopesList,
      ),
    );
  }
}
