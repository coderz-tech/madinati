import '../../../../core/presentation/states/general_state.dart';

class UserAuthenticatedBiometric extends GeneralState {
  final bool isAuthenticated;

  UserAuthenticatedBiometric({required this.isAuthenticated});

  @override
  List<Object> get props => [isAuthenticated];
}
