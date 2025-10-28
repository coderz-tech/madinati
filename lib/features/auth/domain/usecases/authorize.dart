import 'package:flutter_appauth/flutter_appauth.dart';
import '../../../../core/constants/app_constants.dart';

class Authorize {
  final FlutterAppAuth appAuth;
  Authorize({required this.appAuth});
  @override
  Future<AuthorizationTokenResponse?> nullableCall() async {
    List<String> scopesList = AppConstants.scopes.split(',');
    return await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        AppConstants.clintID,
        "${AppConstants.appAuthRedirectScheme}://${AppConstants.appAuthRedirectHost}",
        issuer: AppConstants.issuer,
        discoveryUrl: AppConstants.discoveryUrl,
        scopes: scopesList,
      ),
    );
  }
}
