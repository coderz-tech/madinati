import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = dotenv.get("BASE_URL");
  static String getAllDictionary = dotenv.get("GET_ALL_DICTIONARY");

  // ################################################################################################
  static String login = dotenv.get("LOGIN");
  static String operationalPlanList = dotenv.get("OPERATION_PLAN_LIST");
  static String operationalPlanDetails = dotenv.get("OPERATION_PLAN_DETAILS");
  static String startTrip = dotenv.get("START_TRIP");
  static String endTrip = dotenv.get("END_TRIP");
  static String tripList = dotenv.get("TRIP_LIST");
  static String getTripWithCriteria = dotenv.get("GET_TRIP_WITH_CRITERIA");
  static String tripSearch = dotenv.get("TRIP_SEARCH");
  static String driverTrips = dotenv.get("DRIVER_TRIP_DETAILS");

  /// filter lookup
  static String overnightPoint = dotenv.get("OVERNIGHT_POINT");
  static String disposalPoint = dotenv.get("DISPOSAL_POINT");
  static String crew = dotenv.get("CREW");
  static String vehicle = dotenv.get("VEHICLE");
  static String updateTrip = dotenv.get("UPDATE_TRIP");

  /// OPM trip details
  static String binManagementSearch = dotenv.get("BIN_MANAGEMENT_SEARCH");
  static String binManagementDetails = dotenv.get("BIN_MANAGEMENT_DETAILS");

  /// mohammed
  // These are just a placeholder until the backend is ready
  static String otp = dotenv.get("OTP");
  static String otpVerify = dotenv.get("OTP_VERIFY");
  static String resetPassword = dotenv.get("RESET_PASSWORD");
  static String changePassword = dotenv.get("CNAHGE_PASSWORD");
  static String validateToken = dotenv.get("VALIDATE_TOKEN");
  static String refreshToken = dotenv.get("REFRESH_TOKEN");
  static String tripStatusId = dotenv.get("TRIP_STATUS_ID");
  static String binManualLift = dotenv.get("BIN_MANUAL_LIFT");
  static String manualLiftingReasons = dotenv.get("MANUAL_LIFTING_REASONS");
  static String getTripData = dotenv.get("GET_TRIP_DATA");
  static String getUserProfile = dotenv.get("GET_USER_PROFILE");
  static String binManagementLift = dotenv.get("BIN_MANAGEMENT_LIFT");

  static String notification = dotenv.get("NOTIFICATION");
  static String deleteNotification = dotenv.get("DELETE_NOTIFICATION");
}
