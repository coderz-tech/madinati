import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/reset_password_use_case.dart';
import '../states /reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordCubit({required this.resetPasswordUseCase}) : super(ResetPasswordInitialState());

  resetPassword({required String oldPassword, required String newPassword}) {
    try {
      emit(ResetPasswordLoadingState());
      Map<String, dynamic> body = {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
      resetPasswordUseCase
          .call(body: body)
          .then((response) async {
            emit(ResetPasswordLoadedState(authEntity: response.data!));
          })
          .onError((error, stackTrace) {
            emit(ResetPasswordErrorState(error.toString()));
          });
    } catch (error) {
      emit(ResetPasswordErrorState("${error.toString()} ResetPassword failed"));
    }
  }
}
