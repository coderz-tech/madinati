import 'package:equatable/equatable.dart';

abstract class GeneralState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends GeneralState {}

class LoadingState extends GeneralState {}

class LoadingPaginationState extends GeneralState {}

class ErrorState extends GeneralState {
  final String message;
  final bool showError;

  ErrorState({required this.message, required this.showError});

  @override
  List<Object> get props => [message,showError];
}

class UnauthorizedState extends GeneralState {
  @override
  List<Object> get props => [];
}
