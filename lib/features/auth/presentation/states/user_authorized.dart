import '../../../../core/presentation/states/general_state.dart';
import '../../domain/entities/user.dart';

class UserAuthorized extends GeneralState {
  final User user;

  UserAuthorized({required this.user});

  @override
  List<Object> get props => [user];
}
