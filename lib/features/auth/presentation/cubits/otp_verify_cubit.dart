import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/otp_verify_use_case.dart';
import '../states /otp_verify_state.dart';

class OtpVerifyCubit extends Cubit<OtpVerifyState> {
  OtpVerifyUseCase otpVerifyUseCase;

  OtpVerifyCubit({required this.otpVerifyUseCase})
    : super(OtpVerifyInitialState());

  otpVerify({required String phoneNumber, required String otp}) {
    try {
      emit(OtpVerifyLoadingState());
      Map<String, dynamic> body = {"phoneNumber": phoneNumber, "otp": otp};
      otpVerifyUseCase
          .call(body: body)
          .then((response) async {
            emit(OtpVerifyLoadedState(authEntity: response.data!));
          })
          .onError((error, stackTrace) {
            emit(OtpVerifyErrorState(error.toString()));
          });
    } catch (error) {
      emit(OtpVerifyErrorState("${error.toString()} OtpVerify failed"));
    }
  }
}
