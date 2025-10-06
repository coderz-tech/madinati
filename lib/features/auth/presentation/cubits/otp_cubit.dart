import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/otp_use_case.dart';
import '../states /otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpUseCase otpUseCase;

  OtpCubit({required this.otpUseCase}) : super(OtpInitialState());

  otp({required String phoneNumber}) {
    try {
      emit(OtpLoadingState());
      Map<String, dynamic> body = {"phoneNumber": phoneNumber};
      otpUseCase
          .call(body: body)
          .then((response) async {
            emit(OtpLoadedState(authEntity: response.data!));
          })
          .onError((error, stackTrace) {
            emit(OtpErrorState(error.toString()));
          });
    } catch (error) {
      emit(OtpErrorState("${error.toString()} Otp failed"));
    }
  }
}
