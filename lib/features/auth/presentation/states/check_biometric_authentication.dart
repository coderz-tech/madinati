import '../../../../core/presentation/states/general_state.dart';

class CheckBiometricAuthenticationState extends GeneralState {
  final bool active;
  final bool showDialogAsk;

  CheckBiometricAuthenticationState({
    required this.showDialogAsk,
    required this.active,
  });

  @override
  List<Object> get props => [active, showDialogAsk];
}
