import '../../../../core/network/api_response.dart';
import '../repositories/auth_repository.dart';

class GetUserInfo {
  final AuthRepository repository;

  GetUserInfo(this.repository);

  @override
  Future<ApiResponse<String>> call({required Map<String, dynamic> body}) async {
    return await repository.getUserInfo(body: body);
  }
}
