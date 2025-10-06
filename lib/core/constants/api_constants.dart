import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String getTripContractsBasket =
  dotenv.get("GET_TRIP_CONTRACTS_BASKTET");
  static String binLiftManualCompletion =
  dotenv.get("BIN_LIFT_MANUAL_COMPLETION");
  static String getManualCompletionReasonDDL =
  dotenv.get("GET_MANUAL_COMPLETION_REASON_DDL");
  static String getUserNotifications = dotenv.get("GET_USER_NOTIFICATIONS");
  static String readNotification = dotenv.get("READ_NOTIFCATION");
  static String getOperationPlans = dotenv.get("GET_OPERATION_PLANS");
  static String getOperationPlanDetails =
  dotenv.get("GET_OPERATION_PLAN_DETAILS");
  static String getCurrentTrip = dotenv.get("GET_CURRENT_TRIP");
  static String getNextTrip = dotenv.get("GET_NEXT_TRIP");
  static String getObserverMembers = dotenv.get("GET_OBSERVER_MEMBERS");
  static String getCrmReportComments = dotenv.get("GET_CRM_REPORT_COMMENTS");
  static String insertCrmReportComment =
  dotenv.get("INSERT_CRM_REPORT_COMMENT");
  static String getCrmReports = dotenv.get("GET_CRM_REPORTS");
  static String getCrmReportDetails = dotenv.get("GET_CRM_REPORT_DETAILS");
  static String closeReport = dotenv.get("CLOSE_REPORT");
  static String sendReport = dotenv.get("SEND_REPORT");
  static String getTransporters = dotenv.get("GET_TRANSPORTERS");
  static String getMunicipalityCrmSpecialClassifications =
  dotenv.get("GET_MUNICIPALITY_CRM_SPECIAL_CLASSIFICATIONS");
  static String insertCrmReport = dotenv.get("INSERT_CRM_REPORT");
  static String getViolations = dotenv.get("GET_VIOLATIONS");
  static String getViolationAttachments =
  dotenv.get("GET_VIOLATION_ATTACHMENTS");
  static String checkCommercialRegisterInfo =
  dotenv.get("CHECK_COMMERCIAL_REGISTER_INFO");
  static String checkVehicleInfo = dotenv.get("CHECK_VEHICLE_INFO");
  static String getViolationTerms = dotenv.get("GET_VIOLATION_TERMS");
  static String getViolationTypes = dotenv.get("GET_VIOLATION_TYPES");
  static String createViolation = dotenv.get("CREATE_VIOLATION");
  static String getManualCompleteRequestsByTripCode =
  dotenv.get("GET_MANUAL_COMPLETE_REQUESTS_BY_TRIP_CODE");
  static String getManualCompleteRequestDetails =
  dotenv.get("GET_MANUAL_COMPLETE_REQUEST_DETAILS");
  static String getOperationPlansBasket =
  dotenv.get("GET_OPERATION_PLANS_BASKET");
  static String getOperationPlanEmptyTrip =
  dotenv.get("GET_OPERATION_PLAN_EMPTY_TRIP");
  static String getTripOrders = dotenv.get("GET_TRIP_ORDERS");
  static String getTripsForTransporterTripOrder =
  dotenv.get("GET_TRIPS_FOR_TRANSPORTER_TRIP_ORDER");
  static String addTripToTripOrder = dotenv.get("ADD_TRIP_TO_TRIP_ORDER");
  static String getWasteContractsDDL = dotenv.get("GET_WASTE_CONTRACTS_DDL");
  static String getBinsDetailsForTransporterCreateTripOrder =
  dotenv.get("GET_BINS_DETAILS_FOR_TRANSPORTER_CREATE_TRIP_ORDER");
  static String getListOfBinsAsNumbersByWasteContractCode =
  dotenv.get("GET_LIST_OF_BINS_AS_NUMBERS_BY_WASTE_CONTRACT_CODE");
  static String createTransporterTripOrder =
  dotenv.get("CREATE_TRANSPORTER_TRIP_ORDER");
  static String getTripsBasket = dotenv.get("GET_TRIPS_BASKET");
  static String getTripDetails = dotenv.get("GET_TRIP_DETAILS");
  static String getTripEdit = dotenv.get("GET_TRIP_EDIT");
  static String updateHoldTrip = dotenv.get("UPDATE_HOLD_TRIP");
  static String getToken = dotenv.get("GET_TOKEN");
  static String getClosureReasons = dotenv.get("GET_CLOSURE_REASONS");
  static String changeStatus = dotenv.get("CHANGE_STATUS");
  static String violationByNumbers = dotenv.get("VIOLATION_BY_NUMBERS");
}
