import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../../../../core/utils/io.dart';
import '../../../../core/utils/jwt_decoder.dart';
import '../../../../core/utils/secure_storage_helper.dart';
import '../../domain/usecases/login_use_case.dart';
import '../states /login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  login({
    required String nationalId,
    required String password,
    required String code,
  }) async {
    try {
      emit(LoginLoadingState());
      Map<String, dynamic> body = {
        "Email": nationalId,
        "password": password,
        "Client": 2, //moblie
        "locale": code,
        "mobileToken": await SecureStorageHelper().getPrefString(
          key: AppConstants.FCM_TOKEN,
          defaultValue: "",
        ),
      };
      loginUseCase
          .call(body: body)
          .then((response) async {
            await SecureStorageHelper().savePrefString(
              key: AppConstants.ACCESS_TOKEN,
              value: response.data?.token ?? "",
            );
            await SecureStorageHelper().savePrefString(
              key: AppConstants.REFRESH_TOKEN,
              value: response.data?.refreshToken ?? "",
            );
            IO.printOk("refresh token: ${response.data!.refreshToken}");
            IO.printOk("token: ${response.data!.token}");
            Map<String, dynamic> decodedToken = JwtDecoder.decode(
              response.data!.token ?? "",
            );

            await SecureStorageHelper().savePrefString(
              key: AppConstants.ROLE_ID,
              value: decodedToken["CrewTypeId"],
            );
            emit(LoginLoadedState(authEntity: response.data!));
          })
          .onError((error, stackTrace) {
            emit(LoginErrorState(error.toString()));
          });
    } catch (error) {
      emit(LoginErrorState("${error.toString()} Login failed"));
    }
  }
}
