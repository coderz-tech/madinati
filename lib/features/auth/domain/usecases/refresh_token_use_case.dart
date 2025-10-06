import '../../../../core/network/api_response.dart';
import '../entities/refresh_entity.dart';
import '../repositories/auth_repository.dart';

class RefreshTokenUseCase {
  AuthRepository authRepository;

  RefreshTokenUseCase({required this.authRepository});

  Future<ApiResponse<RefreshEntity>> call({
    required Map<String, dynamic> body,
  }) async {
    return await authRepository.refreshToken(body: body);
  }
}
