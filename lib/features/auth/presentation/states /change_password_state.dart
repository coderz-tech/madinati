
import '../../domain/entities/auth_entity.dart';

abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordLoadedState extends ChangePasswordState {
  final AuthEntity authEntity;

  ChangePasswordLoadedState({required this.authEntity});
}

class ChangePasswordErrorState extends ChangePasswordState {
  final String errorMessage;

  ChangePasswordErrorState(this.errorMessage);
}
