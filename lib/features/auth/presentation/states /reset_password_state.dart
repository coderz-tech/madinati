import '../../domain/entities/auth_entity.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordLoadedState extends ResetPasswordState {
  final AuthEntity authEntity;

  ResetPasswordLoadedState({required this.authEntity});
}

class ResetPasswordErrorState extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordErrorState(this.errorMessage);
}
