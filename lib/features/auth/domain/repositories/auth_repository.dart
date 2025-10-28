import '../../../../core/network/api_response.dart';

abstract class AuthRepository {
  Future<ApiResponse<String>> getUserInfo({required Map<String, dynamic> body});

}
