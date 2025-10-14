import 'dart:ui';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String API_URL = dotenv.get("API_URL");
  static String LANGUAGE_CODE = "languageCode";
  static String FCM_TOKEN = "fcmToken";
  static String IS_DARK_THEME = "isDarkTheme";
  static String ACCESS_TOKEN = "accessToken";
  static String REFRESH_TOKEN = "refreshToken";
  static String DEFULT_LANGUAGE_CODE = "en";
  static String BIOMETRICE_ACTIVE = "biometricActive";
  static String BIOMETRICE_AVAILABLE = "biometricAvailable";
  static List<Locale> SUPPORTTED_LOCALES = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('hi'),
    const Locale('ur'),
  ];

  static String clintID = dotenv.get("CLINT_ID");
  static String mapUrl = dotenv.get("MAP_URL");
  static String appAuthRedirectScheme = dotenv.get("APP_AUTH_REDIRECT_SCHEME");
  static String appAuthRedirectHost = dotenv.get("APP_AUTH_REDIRECT_HOST");
  static String issuer = dotenv.get("ISSUER");
  static String discoveryUrl = dotenv.get("DISCOVERY_URL");
  static String scopes = dotenv.get("SCOPES");
  static String notificationTypeGeneralNotification = "218";
  static String notificationBinLift = "219";
  static String notificationTripStart = "220";
  static String notificationTripEnd = "221";
  static String notificationAssignToTrip = "222";
  static String notificationRemovalFromTrip = "223";
  static bool isStgOrDevOrMock = bool.parse(
    dotenv.get("IS_STG_OR_DEV_OR_MOCK"),
  );
}
