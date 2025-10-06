import '../../domain/entities/auth_entity.dart';

abstract class OtpVerifyState {}

class OtpVerifyInitialState extends OtpVerifyState {}

class OtpVerifyLoadingState extends OtpVerifyState {}

class OtpVerifyLoadedState extends OtpVerifyState {
  final AuthEntity authEntity;

  OtpVerifyLoadedState({required this.authEntity});
}

class OtpVerifyErrorState extends OtpVerifyState {
  final String errorMessage;

  OtpVerifyErrorState(this.errorMessage);
}
