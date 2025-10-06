import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/secure_storage_helper.dart';
import '../../domain/usecases/refresh_token_use_case.dart';
import '../states /refresh_token_state.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class RefreshTokenCubit extends Cubit<RefreshTokenState> {
  RefreshTokenUseCase refreshTokenUseCase;
  final LocalAuthentication auth = LocalAuthentication();

  RefreshTokenCubit({required this.refreshTokenUseCase})
    : super(RefreshTokenInitialState());

  refreshToken({
    required String errorMsg,
    required String localizedReason,
  }) async {
    try {
      emit(RefreshTokenLoadingState());

      try {
        final bool didAuthenticate = await auth.authenticate(
          localizedReason: localizedReason,
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
            useErrorDialogs: false,
          ),
        );
        if (!didAuthenticate) {
          emit(RefreshTokenCancelledState());
          return;
        }
        if (didAuthenticate) {
          final refreshToken = await SecureStorageHelper().getPrefString(
            key: AppConstants.REFRESH_TOKEN,
            defaultValue: "",
          );

          Map<String, dynamic> body = {"refreshToken": refreshToken};
          refreshTokenUseCase
              .call(body: body)
              .then((response) async {
                await SecureStorageHelper().savePrefString(
                  key: AppConstants.ACCESS_TOKEN,
                  value: response.data!.token,
                );
                await SecureStorageHelper().savePrefString(
                  key: AppConstants.REFRESH_TOKEN,
                  value: response.data!.refreshToken,
                );
                emit(RefreshTokenLoadedState(refreshEntity: response.data!));
              })
              .onError((error, stackTrace) {
                emit(RefreshTokenErrorState(errorMsg));
              });
        }
      } catch (error) {
        emit(RefreshTokenErrorState(errorMsg));
      }
    } catch (error) {
      print("");
    }
  }

  Future<void> checkIsAvailable() async {
    emit(HideFingerPrintState());

    try {
      final bool isSupported = await auth.isDeviceSupported();

      final bool canCheck = await auth.canCheckBiometrics;

      final types = await auth.getAvailableBiometrics();
      final bool hasEnrolled = types.isNotEmpty;

      final bool isRealDevice =
          !(Platform.isAndroid || Platform.isIOS) ? false : true;

      final bool canAuthenticate =
          isSupported && canCheck && hasEnrolled && isRealDevice;

      if (!canAuthenticate) {
        emit(HideFingerPrintState());
        return;
      }

      final refreshToken = await SecureStorageHelper().getPrefString(
        key: AppConstants.REFRESH_TOKEN,
        defaultValue: "",
      );
      final accessToken = await SecureStorageHelper().getPrefString(
        key: AppConstants.ACCESS_TOKEN,
        defaultValue: "",
      );

      if (refreshToken.isNotEmpty && accessToken.isNotEmpty) {
        emit(ShowFingerPrintState());
      } else {
        emit(HideFingerPrintState());
      }
    } on PlatformException catch (e) {
      emit(HideFingerPrintState());
    } catch (_) {
      emit(HideFingerPrintState());
    }
  }
}
