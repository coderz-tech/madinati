import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('hi'),
    Locale('ur'),
  ];

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get no_internet_connection;

  /// No description provided for @error_occurred_while_communication_with_server_with_statusCode.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while communicating with the server with status code'**
  String get error_occurred_while_communication_with_server_with_statusCode;

  /// No description provided for @error_during_communication.
  ///
  /// In en, this message translates to:
  /// **'Error during communication'**
  String get error_during_communication;

  /// No description provided for @invalid_request.
  ///
  /// In en, this message translates to:
  /// **'Invalid request'**
  String get invalid_request;

  /// No description provided for @unauthorised.
  ///
  /// In en, this message translates to:
  /// **'Unauthorised'**
  String get unauthorised;

  /// No description provided for @invalid_input.
  ///
  /// In en, this message translates to:
  /// **'Invalid input'**
  String get invalid_input;

  /// No description provided for @authentication_failed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed'**
  String get authentication_failed;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @start_time.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get start_time;

  /// No description provided for @end_time.
  ///
  /// In en, this message translates to:
  /// **'End time'**
  String get end_time;

  /// No description provided for @view_bins.
  ///
  /// In en, this message translates to:
  /// **'View bins'**
  String get view_bins;

  /// No description provided for @view_map.
  ///
  /// In en, this message translates to:
  /// **'View map'**
  String get view_map;

  /// No description provided for @manifest_name.
  ///
  /// In en, this message translates to:
  /// **'Manifest name'**
  String get manifest_name;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @binType.
  ///
  /// In en, this message translates to:
  /// **'Bin type'**
  String get binType;

  /// No description provided for @wasteType.
  ///
  /// In en, this message translates to:
  /// **'Waste type'**
  String get wasteType;

  /// No description provided for @binStatus.
  ///
  /// In en, this message translates to:
  /// **'Bin status'**
  String get binStatus;

  /// No description provided for @manually.
  ///
  /// In en, this message translates to:
  /// **'Manually'**
  String get manually;

  /// No description provided for @operational_plan.
  ///
  /// In en, this message translates to:
  /// **'Operational plan'**
  String get operational_plan;

  /// No description provided for @complaints.
  ///
  /// In en, this message translates to:
  /// **'Complaints'**
  String get complaints;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get dark_mode;

  /// No description provided for @light_mode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get light_mode;

  /// No description provided for @operational_plan_number.
  ///
  /// In en, this message translates to:
  /// **'Operational plan number'**
  String get operational_plan_number;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get change_language;

  /// No description provided for @login_to_your_account.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get login_to_your_account;

  /// No description provided for @no_thank.
  ///
  /// In en, this message translates to:
  /// **'No thank you'**
  String get no_thank;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @lang_name.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get lang_name;

  /// No description provided for @welcome_back_enter_your_data_to_start_working_with_us.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Enter your data to start working with us.'**
  String get welcome_back_enter_your_data_to_start_working_with_us;

  /// No description provided for @entry_with_id_residency_number.
  ///
  /// In en, this message translates to:
  /// **'Entry with ID/Residency number'**
  String get entry_with_id_residency_number;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @select_language.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get select_language;

  /// No description provided for @plans.
  ///
  /// In en, this message translates to:
  /// **'Plans'**
  String get plans;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @current_trip.
  ///
  /// In en, this message translates to:
  /// **'Current trip'**
  String get current_trip;

  /// No description provided for @next_trip.
  ///
  /// In en, this message translates to:
  /// **'Next trip'**
  String get next_trip;

  /// No description provided for @operational_plans.
  ///
  /// In en, this message translates to:
  /// **'Operational plans'**
  String get operational_plans;

  /// No description provided for @name_of_the_operational_plan.
  ///
  /// In en, this message translates to:
  /// **'Name of the operational plan'**
  String get name_of_the_operational_plan;

  /// No description provided for @view_trip.
  ///
  /// In en, this message translates to:
  /// **'View trip'**
  String get view_trip;

  /// No description provided for @vehicle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get vehicle;

  /// No description provided for @tracking_company.
  ///
  /// In en, this message translates to:
  /// **'Tracking company'**
  String get tracking_company;

  /// No description provided for @type_of_waste.
  ///
  /// In en, this message translates to:
  /// **'Type of waste'**
  String get type_of_waste;

  /// No description provided for @flight_time.
  ///
  /// In en, this message translates to:
  /// **'Flight time'**
  String get flight_time;

  /// No description provided for @starting_point.
  ///
  /// In en, this message translates to:
  /// **'Starting point'**
  String get starting_point;

  /// No description provided for @disposal_point.
  ///
  /// In en, this message translates to:
  /// **'Disposal point'**
  String get disposal_point;

  /// No description provided for @starting_location.
  ///
  /// In en, this message translates to:
  /// **'Starting location'**
  String get starting_location;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @operational_plan_days.
  ///
  /// In en, this message translates to:
  /// **'Operational plan days'**
  String get operational_plan_days;

  /// No description provided for @operational_plan_details.
  ///
  /// In en, this message translates to:
  /// **'Operational plan details'**
  String get operational_plan_details;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @drivers_name.
  ///
  /// In en, this message translates to:
  /// **'Driver\'s name'**
  String get drivers_name;

  /// No description provided for @identity_residency_number.
  ///
  /// In en, this message translates to:
  /// **'ID/Residency number'**
  String get identity_residency_number;

  /// No description provided for @dob.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dob;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @bins.
  ///
  /// In en, this message translates to:
  /// **'Bins'**
  String get bins;

  /// No description provided for @chip_number.
  ///
  /// In en, this message translates to:
  /// **'Chip number'**
  String get chip_number;

  /// No description provided for @bin_type.
  ///
  /// In en, this message translates to:
  /// **'Bin type'**
  String get bin_type;

  /// No description provided for @estimated_size.
  ///
  /// In en, this message translates to:
  /// **'Estimated size'**
  String get estimated_size;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @status_.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status_;

  /// No description provided for @manual_assembly_attachments.
  ///
  /// In en, this message translates to:
  /// **'Manual assembly attachments'**
  String get manual_assembly_attachments;

  /// No description provided for @sticker_chip_number.
  ///
  /// In en, this message translates to:
  /// **'Sticker chip number'**
  String get sticker_chip_number;

  /// No description provided for @reason_for_manual_unloading.
  ///
  /// In en, this message translates to:
  /// **'Reason for manual unloading'**
  String get reason_for_manual_unloading;

  /// No description provided for @please_write_the_reason_for_manual_assembly.
  ///
  /// In en, this message translates to:
  /// **'Please write the reason for manual assembly'**
  String get please_write_the_reason_for_manual_assembly;

  /// No description provided for @attached_images.
  ///
  /// In en, this message translates to:
  /// **'Attached images'**
  String get attached_images;

  /// No description provided for @attached_images_.
  ///
  /// In en, this message translates to:
  /// **'Attached images*'**
  String get attached_images_;

  /// No description provided for @you_must_take_a_minimum_of_3_photos_and_a_maximum_of_10_photos.
  ///
  /// In en, this message translates to:
  /// **'You must take a minimum of 3 photos and a maximum of 10 photos.'**
  String get you_must_take_a_minimum_of_3_photos_and_a_maximum_of_10_photos;

  /// No description provided for @choose_the_reason_for_manual_assembly.
  ///
  /// In en, this message translates to:
  /// **'Choose the reason for manual assembly'**
  String get choose_the_reason_for_manual_assembly;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @view_location.
  ///
  /// In en, this message translates to:
  /// **'View location'**
  String get view_location;

  /// No description provided for @view_trip_path.
  ///
  /// In en, this message translates to:
  /// **'View trip path'**
  String get view_trip_path;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @select_the_reason_for_manual_collection.
  ///
  /// In en, this message translates to:
  /// **'Select the reason for manual collection'**
  String get select_the_reason_for_manual_collection;

  /// No description provided for @another_reason.
  ///
  /// In en, this message translates to:
  /// **'Another reason'**
  String get another_reason;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @alerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get alerts;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Incidents'**
  String get reports;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @no_current_trip.
  ///
  /// In en, this message translates to:
  /// **'No current trip.'**
  String get no_current_trip;

  /// No description provided for @no_next_trip.
  ///
  /// In en, this message translates to:
  /// **'No next trip.'**
  String get no_next_trip;

  /// No description provided for @no_operation_plan.
  ///
  /// In en, this message translates to:
  /// **'No operational plans.'**
  String get no_operation_plan;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get something_went_wrong;

  /// No description provided for @location_error.
  ///
  /// In en, this message translates to:
  /// **'Location error'**
  String get location_error;

  /// No description provided for @you_are_outside_the_permitted_range_for_manual_assembly.
  ///
  /// In en, this message translates to:
  /// **'You are outside the permitted range for manual assembly'**
  String get you_are_outside_the_permitted_range_for_manual_assembly;

  /// No description provided for @gps_is_not_active.
  ///
  /// In en, this message translates to:
  /// **'GPS is not active'**
  String get gps_is_not_active;

  /// No description provided for @please_grant_permission_to_the_location_services.
  ///
  /// In en, this message translates to:
  /// **'Please grant permission to the location services'**
  String get please_grant_permission_to_the_location_services;

  /// No description provided for @manual_unloading_was_completed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Manual unloading was completed successfully'**
  String get manual_unloading_was_completed_successfully;

  /// No description provided for @operation_accomplished_successfully.
  ///
  /// In en, this message translates to:
  /// **'Operation accomplished successfully'**
  String get operation_accomplished_successfully;

  /// No description provided for @unread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// No description provided for @read.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read;

  /// No description provided for @violations.
  ///
  /// In en, this message translates to:
  /// **'Violations'**
  String get violations;

  /// No description provided for @current_trips.
  ///
  /// In en, this message translates to:
  /// **'Current trips'**
  String get current_trips;

  /// No description provided for @next_trips.
  ///
  /// In en, this message translates to:
  /// **'Next trips'**
  String get next_trips;

  /// No description provided for @hold_trips.
  ///
  /// In en, this message translates to:
  /// **'Pending trips'**
  String get hold_trips;

  /// No description provided for @completed_trips.
  ///
  /// In en, this message translates to:
  /// **'Completed trips'**
  String get completed_trips;

  /// No description provided for @save_your_biometric_login_for_future_logins.
  ///
  /// In en, this message translates to:
  /// **'Save your biometric login for future logins?'**
  String get save_your_biometric_login_for_future_logins;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @no_trips.
  ///
  /// In en, this message translates to:
  /// **'No trips.'**
  String get no_trips;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @show_manual_uploads.
  ///
  /// In en, this message translates to:
  /// **'Show manual uploads'**
  String get show_manual_uploads;

  /// No description provided for @no_notifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get no_notifications;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get try_again;

  /// No description provided for @something_went_wrong_please_try_again.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again.'**
  String get something_went_wrong_please_try_again;

  /// No description provided for @trip_day_and_date.
  ///
  /// In en, this message translates to:
  /// **'Trip day and date'**
  String get trip_day_and_date;

  /// No description provided for @view_trip_details.
  ///
  /// In en, this message translates to:
  /// **'View trip details'**
  String get view_trip_details;

  /// No description provided for @trip_details.
  ///
  /// In en, this message translates to:
  /// **'Trip details'**
  String get trip_details;

  /// No description provided for @trip_date.
  ///
  /// In en, this message translates to:
  /// **'Trip date'**
  String get trip_date;

  /// No description provided for @manual_uploads.
  ///
  /// In en, this message translates to:
  /// **'Manual uploads'**
  String get manual_uploads;

  /// No description provided for @no_manual_uploads.
  ///
  /// In en, this message translates to:
  /// **'No manual uploads'**
  String get no_manual_uploads;

  /// No description provided for @upload_date_and_time.
  ///
  /// In en, this message translates to:
  /// **'Upload date and time'**
  String get upload_date_and_time;

  /// No description provided for @smart_chip_number.
  ///
  /// In en, this message translates to:
  /// **'Smart chip number'**
  String get smart_chip_number;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @upload_details.
  ///
  /// In en, this message translates to:
  /// **'Manual upload details'**
  String get upload_details;

  /// No description provided for @bin_status.
  ///
  /// In en, this message translates to:
  /// **'Bin status'**
  String get bin_status;

  /// No description provided for @what_is_the_problem.
  ///
  /// In en, this message translates to:
  /// **'What is the problem'**
  String get what_is_the_problem;

  /// No description provided for @photos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photos;

  /// No description provided for @trip_start_date_and_time.
  ///
  /// In en, this message translates to:
  /// **'Trip start date and time'**
  String get trip_start_date_and_time;

  /// No description provided for @edit_trip.
  ///
  /// In en, this message translates to:
  /// **'Edit trip'**
  String get edit_trip;

  /// No description provided for @edit_on.
  ///
  /// In en, this message translates to:
  /// **'Edit on'**
  String get edit_on;

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driver;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @please_select.
  ///
  /// In en, this message translates to:
  /// **'Please select'**
  String get please_select;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @has_been_modified_successfully.
  ///
  /// In en, this message translates to:
  /// **'Has been modified successfully.'**
  String get has_been_modified_successfully;

  /// No description provided for @requests_received.
  ///
  /// In en, this message translates to:
  /// **'Requests received'**
  String get requests_received;

  /// No description provided for @requests_sent.
  ///
  /// In en, this message translates to:
  /// **'Requests sent'**
  String get requests_sent;

  /// No description provided for @order_location.
  ///
  /// In en, this message translates to:
  /// **'Order location'**
  String get order_location;

  /// No description provided for @number_of_bins.
  ///
  /// In en, this message translates to:
  /// **'Number of bins'**
  String get number_of_bins;

  /// No description provided for @bins_size.
  ///
  /// In en, this message translates to:
  /// **'Bins size'**
  String get bins_size;

  /// No description provided for @date_and_time_of_order.
  ///
  /// In en, this message translates to:
  /// **'Date and time of order'**
  String get date_and_time_of_order;

  /// No description provided for @transfer_request_date.
  ///
  /// In en, this message translates to:
  /// **'Transfer request date'**
  String get transfer_request_date;

  /// No description provided for @name_of_the_request_sender.
  ///
  /// In en, this message translates to:
  /// **'Name of the request sender'**
  String get name_of_the_request_sender;

  /// No description provided for @trip.
  ///
  /// In en, this message translates to:
  /// **'Trip'**
  String get trip;

  /// No description provided for @received_transfer_request.
  ///
  /// In en, this message translates to:
  /// **'Received transfer request'**
  String get received_transfer_request;

  /// No description provided for @appointment_on_a_trip.
  ///
  /// In en, this message translates to:
  /// **'Appointment on a trip'**
  String get appointment_on_a_trip;

  /// No description provided for @no_item_found.
  ///
  /// In en, this message translates to:
  /// **'No item found'**
  String get no_item_found;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @under_review.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get under_review;

  /// No description provided for @new_2.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get new_2;

  /// No description provided for @special_classification.
  ///
  /// In en, this message translates to:
  /// **'Special classification'**
  String get special_classification;

  /// No description provided for @sub_classification.
  ///
  /// In en, this message translates to:
  /// **'Sub classification'**
  String get sub_classification;

  /// No description provided for @date_and_time_of_report.
  ///
  /// In en, this message translates to:
  /// **'Date and time of incident'**
  String get date_and_time_of_report;

  /// No description provided for @time_allowed_to_process_the_report.
  ///
  /// In en, this message translates to:
  /// **'Time allowed to process the incident'**
  String get time_allowed_to_process_the_report;

  /// No description provided for @report_processing.
  ///
  /// In en, this message translates to:
  /// **'Incident processing'**
  String get report_processing;

  /// No description provided for @subject_of_the_report.
  ///
  /// In en, this message translates to:
  /// **'Subject of the incident'**
  String get subject_of_the_report;

  /// No description provided for @enter_subject_of_the_report.
  ///
  /// In en, this message translates to:
  /// **'Enter subject of the incident'**
  String get enter_subject_of_the_report;

  /// No description provided for @subject_of_the_report_.
  ///
  /// In en, this message translates to:
  /// **'Subject of the incident*'**
  String get subject_of_the_report_;

  /// No description provided for @view_report_details.
  ///
  /// In en, this message translates to:
  /// **'View incident details'**
  String get view_report_details;

  /// No description provided for @follow_up_on_the_report.
  ///
  /// In en, this message translates to:
  /// **'Follow up on the incident'**
  String get follow_up_on_the_report;

  /// No description provided for @follow_up_record.
  ///
  /// In en, this message translates to:
  /// **'Follow up record'**
  String get follow_up_record;

  /// No description provided for @report_details.
  ///
  /// In en, this message translates to:
  /// **'Incident details'**
  String get report_details;

  /// No description provided for @reply_to_the_report.
  ///
  /// In en, this message translates to:
  /// **'Reply to the incident'**
  String get reply_to_the_report;

  /// No description provided for @record_the_subject_of_the_report.
  ///
  /// In en, this message translates to:
  /// **'Record the subject of the incident'**
  String get record_the_subject_of_the_report;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @violation_reference_number.
  ///
  /// In en, this message translates to:
  /// **'Violation reference number'**
  String get violation_reference_number;

  /// No description provided for @violation_value.
  ///
  /// In en, this message translates to:
  /// **'Violation value'**
  String get violation_value;

  /// No description provided for @violation_status.
  ///
  /// In en, this message translates to:
  /// **'Violation status'**
  String get violation_status;

  /// No description provided for @date_and_time_of_violation.
  ///
  /// In en, this message translates to:
  /// **'Date and time of violation'**
  String get date_and_time_of_violation;

  /// No description provided for @observers.
  ///
  /// In en, this message translates to:
  /// **'Observers'**
  String get observers;

  /// No description provided for @number_of_reports_closed.
  ///
  /// In en, this message translates to:
  /// **'Number of incidents closed'**
  String get number_of_reports_closed;

  /// No description provided for @municipality.
  ///
  /// In en, this message translates to:
  /// **'Municipality'**
  String get municipality;

  /// No description provided for @view_supervisor_reports.
  ///
  /// In en, this message translates to:
  /// **'View supervisor incidents'**
  String get view_supervisor_reports;

  /// No description provided for @there_is_no_observer.
  ///
  /// In en, this message translates to:
  /// **'There is no observer'**
  String get there_is_no_observer;

  /// No description provided for @no_reports.
  ///
  /// In en, this message translates to:
  /// **'No incidents'**
  String get no_reports;

  /// No description provided for @no_violations.
  ///
  /// In en, this message translates to:
  /// **'No violations'**
  String get no_violations;

  /// No description provided for @no_comments.
  ///
  /// In en, this message translates to:
  /// **'No follow-up available for this incident'**
  String get no_comments;

  /// No description provided for @view_violation_attachments.
  ///
  /// In en, this message translates to:
  /// **'View violation attachments'**
  String get view_violation_attachments;

  /// No description provided for @attached_photos_in_the_violation.
  ///
  /// In en, this message translates to:
  /// **'Attached photos in the violation'**
  String get attached_photos_in_the_violation;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @create_violation.
  ///
  /// In en, this message translates to:
  /// **'Create violation'**
  String get create_violation;

  /// No description provided for @violation_type.
  ///
  /// In en, this message translates to:
  /// **'Violation type*'**
  String get violation_type;

  /// No description provided for @company_name.
  ///
  /// In en, this message translates to:
  /// **'Company name*'**
  String get company_name;

  /// No description provided for @vehicle_number.
  ///
  /// In en, this message translates to:
  /// **'Vehicle number*'**
  String get vehicle_number;

  /// No description provided for @plate_characters.
  ///
  /// In en, this message translates to:
  /// **'Plate characters'**
  String get plate_characters;

  /// No description provided for @plate_number.
  ///
  /// In en, this message translates to:
  /// **'Plate number'**
  String get plate_number;

  /// No description provided for @commercial_register.
  ///
  /// In en, this message translates to:
  /// **'Commercial register*'**
  String get commercial_register;

  /// No description provided for @enter_commercial_register_number.
  ///
  /// In en, this message translates to:
  /// **'Enter commercial register number'**
  String get enter_commercial_register_number;

  /// No description provided for @objected.
  ///
  /// In en, this message translates to:
  /// **'Objected'**
  String get objected;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @inquiry.
  ///
  /// In en, this message translates to:
  /// **'Inquiry'**
  String get inquiry;

  /// No description provided for @violation_terms.
  ///
  /// In en, this message translates to:
  /// **'Violation terms*'**
  String get violation_terms;

  /// No description provided for @close_the_report_case.
  ///
  /// In en, this message translates to:
  /// **'Close the incident case'**
  String get close_the_report_case;

  /// No description provided for @violation_term.
  ///
  /// In en, this message translates to:
  /// **'Violation term'**
  String get violation_term;

  /// No description provided for @send_report.
  ///
  /// In en, this message translates to:
  /// **'Send incident'**
  String get send_report;

  /// No description provided for @transporter_name.
  ///
  /// In en, this message translates to:
  /// **'Transporter name*'**
  String get transporter_name;

  /// No description provided for @transporter_name_.
  ///
  /// In en, this message translates to:
  /// **'Transporter name'**
  String get transporter_name_;

  /// No description provided for @save_and_send.
  ///
  /// In en, this message translates to:
  /// **'Save and send'**
  String get save_and_send;

  /// No description provided for @create_report.
  ///
  /// In en, this message translates to:
  /// **'Create incident'**
  String get create_report;

  /// No description provided for @name_of_the_violation_recipient.
  ///
  /// In en, this message translates to:
  /// **'Name of the violation recipient'**
  String get name_of_the_violation_recipient;

  /// No description provided for @sadad_number.
  ///
  /// In en, this message translates to:
  /// **'Sadad number'**
  String get sadad_number;

  /// No description provided for @violation_amount.
  ///
  /// In en, this message translates to:
  /// **'Violation amount'**
  String get violation_amount;

  /// No description provided for @actual_start_time.
  ///
  /// In en, this message translates to:
  /// **'Actual start time'**
  String get actual_start_time;

  /// No description provided for @delay_time.
  ///
  /// In en, this message translates to:
  /// **'Delay time'**
  String get delay_time;

  /// No description provided for @time_spent_on_the_trip.
  ///
  /// In en, this message translates to:
  /// **'Time spent on the trip'**
  String get time_spent_on_the_trip;

  /// No description provided for @actual_end_time.
  ///
  /// In en, this message translates to:
  /// **'Actual end time'**
  String get actual_end_time;

  /// No description provided for @please_select_transporter.
  ///
  /// In en, this message translates to:
  /// **'Choose transporter'**
  String get please_select_transporter;

  /// No description provided for @please_select_special_classification.
  ///
  /// In en, this message translates to:
  /// **'Choose special classification'**
  String get please_select_special_classification;

  /// No description provided for @please_select_violation_type.
  ///
  /// In en, this message translates to:
  /// **'Choose violation type'**
  String get please_select_violation_type;

  /// No description provided for @please_select_company.
  ///
  /// In en, this message translates to:
  /// **'Choose company'**
  String get please_select_company;

  /// No description provided for @please_select_violation_terms.
  ///
  /// In en, this message translates to:
  /// **'Choose violation terms'**
  String get please_select_violation_terms;

  /// No description provided for @please_select_order_location.
  ///
  /// In en, this message translates to:
  /// **'Choose order location'**
  String get please_select_order_location;

  /// No description provided for @please_select_number_of_bins.
  ///
  /// In en, this message translates to:
  /// **'Choose number of bins'**
  String get please_select_number_of_bins;

  /// No description provided for @please_select_trip.
  ///
  /// In en, this message translates to:
  /// **'Choose trip'**
  String get please_select_trip;

  /// No description provided for @observers_management.
  ///
  /// In en, this message translates to:
  /// **'Observers Management'**
  String get observers_management;

  /// No description provided for @remaining_time_to_process_the_report.
  ///
  /// In en, this message translates to:
  /// **'Remaining time to process the incident'**
  String get remaining_time_to_process_the_report;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get hour;

  /// No description provided for @no_locations.
  ///
  /// In en, this message translates to:
  /// **'There are no locations'**
  String get no_locations;

  /// No description provided for @the_user_does_not_have_permission_to_this_service.
  ///
  /// In en, this message translates to:
  /// **'The user does not have permission to this service.'**
  String get the_user_does_not_have_permission_to_this_service;

  /// No description provided for @no_requests_received.
  ///
  /// In en, this message translates to:
  /// **'No requests received'**
  String get no_requests_received;

  /// No description provided for @no_requests_sent.
  ///
  /// In en, this message translates to:
  /// **'No requests sent'**
  String get no_requests_sent;

  /// No description provided for @reopened.
  ///
  /// In en, this message translates to:
  /// **'Reopened'**
  String get reopened;

  /// No description provided for @is_report_within_authority.
  ///
  /// In en, this message translates to:
  /// **'Is the Incident within the department\'s authority?'**
  String get is_report_within_authority;

  /// No description provided for @is_report_location_correct.
  ///
  /// In en, this message translates to:
  /// **'Is the Incident location correct?'**
  String get is_report_location_correct;

  /// No description provided for @is_classification_appropriate.
  ///
  /// In en, this message translates to:
  /// **'Is the classification appropriate?'**
  String get is_classification_appropriate;

  /// No description provided for @my_reports.
  ///
  /// In en, this message translates to:
  /// **'My Incident'**
  String get my_reports;

  /// No description provided for @in_active_operational_plans.
  ///
  /// In en, this message translates to:
  /// **'Inactive Operational Plans'**
  String get in_active_operational_plans;

  /// No description provided for @bin.
  ///
  /// In en, this message translates to:
  /// **'Bin'**
  String get bin;

  /// No description provided for @tag.
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get tag;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @lifted.
  ///
  /// In en, this message translates to:
  /// **'Lifted'**
  String get lifted;

  /// No description provided for @notLifted.
  ///
  /// In en, this message translates to:
  /// **'Not lifted'**
  String get notLifted;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'hi', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
