import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/validate_token_use_case.dart';
import '../states /validate_token_state.dart';

class ValidateTokenCubit extends Cubit<ValidateTokenState> {
  ValidateTokenUseCase validateTokenUseCase;

  ValidateTokenCubit({required this.validateTokenUseCase})
    : super(ValidateTokenInitialState());

  validateToken({required String token, required String refreshToken}) {
    try {
      emit(ValidateTokenLoadingState());
      Map<String, dynamic> body = {
        "token": token,
        "refreshToken": refreshToken,
      };
      validateTokenUseCase
          .call(body: body)
          .then((response) async {
            emit(ValidateTokenLoadedState(authEntity: response.data!));
          })
          .onError((error, stackTrace) {
            emit(ValidateTokenErrorState(error.toString()));
          });
    } catch (error) {
      emit(ValidateTokenErrorState("${error.toString()} ValidateToken failed"));
    }
  }
}
