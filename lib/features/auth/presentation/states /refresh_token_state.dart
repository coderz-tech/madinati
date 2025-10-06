import '../../domain/entities/refresh_entity.dart';

abstract class RefreshTokenState {}

class RefreshTokenInitialState extends RefreshTokenState {}

class ShowFingerPrintState extends RefreshTokenState {}

class HideFingerPrintState extends RefreshTokenState {}

class RefreshTokenLoadingState extends RefreshTokenState {}

class RefreshTokenCancelledState extends RefreshTokenState {}

class RefreshTokenLoadedState extends RefreshTokenState {
  final RefreshEntity refreshEntity;

  RefreshTokenLoadedState({required this.refreshEntity});
}

class RefreshTokenErrorState extends RefreshTokenState {
  final String errorMessage;

  RefreshTokenErrorState(this.errorMessage);
}
