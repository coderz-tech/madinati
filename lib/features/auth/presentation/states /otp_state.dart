import '../../domain/entities/auth_entity.dart';

abstract class OtpState {}

class OtpInitialState extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpLoadedState extends OtpState {
  final AuthEntity authEntity;

  OtpLoadedState({required this.authEntity});
}

class OtpErrorState extends OtpState {
  final String errorMessage;

  OtpErrorState(this.errorMessage);
}
