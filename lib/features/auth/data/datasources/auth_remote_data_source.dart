import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse<String>> getUserInfo({required Map<String, dynamic> body});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<ApiResponse<String>> getUserInfo({
    required Map<String, dynamic> body,
  }) async {
    final response = await ApiClient.postDataString<String>(
      endpoint: ApiConstants.getToken,
      body: body,
    );
    return response;
  }
}
