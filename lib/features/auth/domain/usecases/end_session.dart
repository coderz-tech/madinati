import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/secure_storage_helper.dart';

class EndSession {
  final FlutterAppAuth appAuth;

  EndSession({required this.appAuth});

  @override
  Future<void> nullableCall({required Map<String, dynamic> body}) async {
    await appAuth.endSession(
      EndSessionRequest(
        idTokenHint: body.values,
        issuer: AppConstants.issuer,
        postLogoutRedirectUrl:
            "${AppConstants.appAuthRedirectScheme}://${AppConstants.appAuthRedirectHost}",
        discoveryUrl: AppConstants.discoveryUrl,
      ),
    );
    await SecureStorageHelper().remove(key: AppConstants.ACCESS_TOKEN);
  }
}
