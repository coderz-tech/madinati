import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/change_password_use_case.dart';
import '../states /change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit({required this.changePasswordUseCase})
    : super(ChangePasswordInitialState());

  changePassword({required String oldPassword, required String newPassword}) {
    try {
      emit(ChangePasswordLoadingState());
      Map<String, dynamic> body = {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
      changePasswordUseCase
          .call(body: body)
          .then((response) async {
            emit(ChangePasswordLoadedState(authEntity: response.data!));
          })
          .onError((error, stackTrace) {
            emit(ChangePasswordErrorState(error.toString()));
          });
    } catch (error) {
      emit(
        ChangePasswordErrorState("${error.toString()} ChangePassword failed"),
      );
    }
  }
}
