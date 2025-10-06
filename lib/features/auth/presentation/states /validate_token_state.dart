import '../../domain/entities/auth_entity.dart';

abstract class ValidateTokenState {}

class ValidateTokenInitialState extends ValidateTokenState {}

class ValidateTokenLoadingState extends ValidateTokenState {}

class ValidateTokenLoadedState extends ValidateTokenState {
  final AuthEntity authEntity;

  ValidateTokenLoadedState({required this.authEntity});
}

class ValidateTokenErrorState extends ValidateTokenState {
  final String errorMessage;

  ValidateTokenErrorState(this.errorMessage);
}
