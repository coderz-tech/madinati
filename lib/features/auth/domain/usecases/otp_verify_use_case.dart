import '../../../../core/network/api_response.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class OtpVerifyUseCase {
  AuthRepository authRepository;

  OtpVerifyUseCase({required this.authRepository});

  Future<ApiResponse<AuthEntity>> call({
    required Map<String, dynamic> body,
  }) async {
    return await authRepository.otpVerify(body: body);
  }
}
