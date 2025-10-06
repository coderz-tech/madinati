import '../../../../core/network/api_response.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/refresh_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<AuthEntity>> login({
    required Map<String, dynamic> body,
  }) async {
    return await remoteDataSource.login(body: body);
  }
  @override
  Future<ApiResponse<AuthEntity>> otp({
    required Map<String, dynamic> body,
  }) async {
    return await remoteDataSource.otp(body: body);
  }
  @override
  Future<ApiResponse<AuthEntity>> otpVerify({
    required Map<String, dynamic> body,
  }) async {
    return await remoteDataSource.otpVerify(body: body);
  }

  @override
  Future<ApiResponse<AuthEntity>> resetPassword({
    required Map<String, dynamic> body,
  }) async {
    return await remoteDataSource.resetPassword(body: body);
  }
  @override
  Future<ApiResponse<AuthEntity>> validateToken({
    required Map<String, dynamic> body,
  }) async {
    return await remoteDataSource.validateToken(body: body);
  }
  @override
  Future<ApiResponse<RefreshEntity>> refreshToken({
    required Map<String, dynamic> body,
  }) async {
    return await remoteDataSource.refreshToken(body: body);
  }
  @override
  Future<ApiResponse<AuthEntity>> changePassword({
    required Map<String, dynamic> body,
  }) async {
    return await remoteDataSource.changePassword(body: body);
  }

}
