import '../../../../core/network/api_response.dart';
import '../entities/auth_entity.dart';
import '../entities/refresh_entity.dart';

abstract class AuthRepository {
  Future<ApiResponse<AuthEntity>> login({required Map<String, dynamic> body});
  Future<ApiResponse<AuthEntity>> otp({required Map<String, dynamic> body});
  Future<ApiResponse<AuthEntity>> otpVerify({required Map<String, dynamic> body});
  Future<ApiResponse<AuthEntity>> resetPassword({required Map<String, dynamic> body});
  Future<ApiResponse<AuthEntity>> validateToken({required Map<String, dynamic> body});
  Future<ApiResponse<RefreshEntity>> refreshToken({required Map<String, dynamic> body});
  Future<ApiResponse<AuthEntity>> changePassword({required Map<String, dynamic> body});

}
