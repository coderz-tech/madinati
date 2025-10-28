import '../../../../core/network/api_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<String>> getUserInfo({
    required Map<String, dynamic> body,
  }) async {
    return await remoteDataSource.getUserInfo(body: body);
  }
}
