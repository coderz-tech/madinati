import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../../../../core/presentation/bottom_sheet/msg_bottom_sheet.dart';
import '../../../../core/presentation/states/general_state.dart';
import '../../../../core/utils/jwt_decoder.dart';
import '../../../../core/utils/secure_storage_helper.dart';
import '../../../home/domain/entity/bottom_nav_bar_entity.dart';
import '../../../home/presentation/config/nav_config.dart';
import '../../../home/presentation/cubits/nav_bar_cubit.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../operation_plans/presentation/driver/operation_plans/view/operation_plans_screen.dart';
import '../../../tabs/presentation/cubits/tabs_cubit.dart';
import '../../../trips/presentation/driver/current_trip/view/driver_current_trip.dart';
import '../../../trips/presentation/driver/upcoming_trip/view/upcoming_trip_screen.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/authorize.dart';
import '../../domain/usecases/end_session.dart';
import '../../domain/usecases/get_access_token_from_refresh_token.dart';
import '../../domain/usecases/get_user_info.dart';
import '../bottom_sheet/ask_biometric_bottom_sheet.dart';
import '../states/check_biometric_authentication.dart';
import '../states/user_authorized.dart';
import '../states/user_unauthorized.dart';
import 'package:madinati/l10n/app_localizations.dart';
import 'biometric_auth_cubit.dart';

enum UsersType { driver }

class AuthCubit extends Cubit<GeneralState> {
  final GetUserInfo getUserInfo;
  String? ssoToken = "";
  UserModel userModel = UserModel();
  final Authorize authorize;
  final GetAccessTokenFromRefreshToken getAccessTokenFromRefreshToken;
  final EndSession endSession;
  String idToken = "";

  AuthCubit({
    required this.getUserInfo,
    required this.authorize,
    required this.getAccessTokenFromRefreshToken,
    required this.endSession,
  }) : super(InitialState());

  authorization({required BuildContext context}) async {
    emit(LoadingState());
    try {
      /// todo with anas
      final result = await authorize.nullableCall();//await authorize.appAuth.token();
      idToken = result!.idToken!;
      ssoToken = result.accessToken;
      log("ssoToken = $ssoToken");
      fetchUserInfo(context: context);
    } catch (error) {
      emit(ErrorState(message: error.toString(), showError: true));
    }
  }

  fetchUserInfo({required BuildContext context}) async {
    emit(LoadingState());
    getUserInfo
        .call(
        body: {
          "scope": const [
            "WasteManagement.API",
            "WasteManagement.API",
            "WasteManagement.API"
          ],
          "ssoToken": ssoToken,
          "deviceToken": await SecureStorageHelper()
              .getPrefString(key: AppConstants.FCM_TOKEN, defaultValue: ""),
          "isHuwaei": false,
          "isArabic": context
                  .read<LocaleCubit>()
                  .listLocalModel
                  .firstWhere((element) => element.isCurrent)
                  .code ==
              "ar",
          "deviceOS": Platform.operatingSystem,
          "osVersion": Platform.operatingSystemVersion
        },
    )
        .then(
      (value) async {
        try {
          log("value.data = ${value.data}");

          await SecureStorageHelper().savePrefString(
            key: AppConstants.ACCESS_TOKEN,
            value: value.data!,
          );

          Map<String, dynamic> decodedToken = JwtDecoder.decode(value.data!);

          String userInfo = decodedToken["UserInfo"];
          var userInfoObject = jsonDecode(userInfo);
          userModel.idNumber = userInfoObject["id_no"];
          userModel.dob = userInfoObject["dob"];
          userModel.nationality = userInfoObject["nationality"];
          userModel.phoneNumber = userInfoObject["phone"];
          if (context
                  .read<LocaleCubit>()
                  .listLocalModel
                  .firstWhere(
                    (element) => element.isCurrent,
                  )
                  .code ==
              "ar") {
            userModel.name = userInfoObject["ar_name"];
          } else {
            userModel.name = userInfoObject["en_name"];
          }

          userModel.role = decodedToken["Role"];

          if (userModel.role == null || userModel.role == "") {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => MsgBottomSheet(
                title: AppLocalizations.of(context)!
                    .the_user_does_not_have_permission_to_this_service,
                msg: "",
                imagePath: "assets/images/wrong.svg",
              ),
            ).then(
              (value) {
                endSessionReq();
              },
            );
          } else {
            emit(UserAuthorized(user: userModel));

            CheckBiometricAuthenticationState
                checkBiometricAuthenticationState = context
                    .read<BiometricAuthCubit>()
                    .state as CheckBiometricAuthenticationState;

            if (checkBiometricAuthenticationState.active) {
              goToScreen(context: context);
            } else if (checkBiometricAuthenticationState.showDialogAsk) {
              showDialogAsk(context: context);
            } else {
              goToScreen(context: context);
            }
          }
        } catch (error) {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => MsgBottomSheet(
              title: AppLocalizations.of(context)!.something_went_wrong,
              msg: "",
              imagePath: "assets/images/wrong.svg",
            ),
          ).then(
            (value) {
              endSessionReq();
            },
          );

          emit(ErrorState(message: error.toString(), showError: true));
          print(error.toString());
        }
      },
      onError: (error) {
        emit(ErrorState(message: error.toString(), showError: true));
        print(error.toString());
      },
    );
  }

  Future fetchUserInfoChangeLang({required BuildContext context}) async {
    emit(LoadingState());

    await getUserInfo
        .call(
        body: {
          "scope": const [
            "WasteManagement.API",
            "WasteManagement.API",
            "WasteManagement.API"
          ],
          "ssoToken": ssoToken,
          "deviceToken": await SecureStorageHelper()
              .getPrefString(key: AppConstants.FCM_TOKEN, defaultValue: ""),
          "isHuwaei": false,
          "isArabic": context
                  .read<LocaleCubit>()
                  .listLocalModel
                  .firstWhere((element) => element.isCurrent)
                  .code ==
              "ar",
          "deviceOS": Platform.operatingSystem,
          "osVersion": Platform.operatingSystemVersion
        },
    )
        .then(
      (value) async {
        try {
          await SecureStorageHelper().savePrefString(
            key: AppConstants.ACCESS_TOKEN,
            value: value.data!,
          );

          log("value.data.lang = ${value.data}");

          Map<String, dynamic> decodedToken = JwtDecoder.decode(value.data!);

          String userInfo = decodedToken["UserInfo"];
          var userInfoObject = jsonDecode(userInfo);

          userModel.idNumber = userInfoObject["id_no"];
          userModel.role = decodedToken["Role"];
          userModel.dob = userInfoObject["dob"];
          userModel.nationality = userInfoObject["nationality"];
          userModel.phoneNumber = userInfoObject["phone"];
          if (context
                  .read<LocaleCubit>()
                  .listLocalModel
                  .firstWhere(
                    (element) => element.isCurrent,
                  )
                  .code ==
              "ar") {
            userModel.name = userInfoObject["ar_name"];
          } else {
            userModel.name = userInfoObject["en_name"];
          }

          emit(UserAuthorized(user: userModel));
        } catch (error) {
          emit(ErrorState(message: error.toString(), showError: true));
          print(error.toString());
        }
      },
      onError: (error) {
        emit(ErrorState(message: error.toString(), showError: true));
        print(error.toString());
      },
    );
  }

  getAccessTokenFromRefreshTokenReq({required BuildContext context}) async {
    emit(LoadingState());
    try {
      await getAccessTokenFromRefreshToken.nullableCall().then(
        (result) {
          idToken = result!.idToken!;
          SecureStorageHelper().savePrefString(
            key: AppConstants.REFRESH_TOKEN,
            value: result.refreshToken!,
          );
          ssoToken = result.accessToken;
          fetchUserInfo(context: context);
        },
      );
    } catch (error) {
      emit(ErrorState(message: error.toString(), showError: true));
    }
  }

  Future<bool> endSessionReq() async {
    try {
      await endSession.nullableCall(body:  idToken);
      emit(UserUnauthorized());
      return true;
    } catch (e) {
      emit(UserUnauthorized());
      return true;
    }
  }

  showDialogAsk({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const AskBiometricBottomSheet();
      },
    ).then(
      (value) {
        goToScreen(context: context);
      },
    );
  }

  goToScreen({required BuildContext context}) {
    if (userModel.role == "Driver") {
      final navCubit = NavBarCubit()..load(Actor.driver);
      print(navCubit);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: navCubit,
            child: const HomeScreen(),
          ),
        ),
      );
    } else if (userModel.role == "OperationManager") {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const OperationManagerMainScreen(),
      //   ),
      // );
    } else if (userModel.role == "ObserverManager") {
      // context
      //     .read<ObserverManagerBottomNavigationBarCubit>()
      //     .changeSelected(index: 3);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const ObserverManagerMainScreen(),
      //   ),
      // );
    } else if (userModel.role == "ObserverMember") {

      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => MsgBottomSheet(
          title: AppLocalizations.of(context)!
              .the_user_does_not_have_permission_to_this_service,
          msg: "",
          imagePath: "assets/images/wrong.svg",
        ),
      ).then(
        (value) {
          endSessionReq();
        },
      );
    } else if (userModel.role == "OperationalBusinessOfficer") {
      // context
      //     .read<ObserverMemberBottomNavigationBarCubit>()
      //     .changeSelected(index: 3);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const OperationalBusinessOfficerMainScreen(),
      //   ),
      // );
    }


  }
}
