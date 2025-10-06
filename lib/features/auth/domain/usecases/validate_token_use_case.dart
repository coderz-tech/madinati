import '../../../../core/network/api_response.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class ValidateTokenUseCase {
  AuthRepository authRepository;

  ValidateTokenUseCase({required this.authRepository});

  Future<ApiResponse<AuthEntity>> call({
    required Map<String, dynamic> body,
  }) async {
    return await authRepository.validateToken(body: body);
  }
}
