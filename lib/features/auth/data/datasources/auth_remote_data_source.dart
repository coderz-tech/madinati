import 'package:http/http.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/refresh_entity.dart';
import '../models/auth_model.dart';
import '../models/refresh_model.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse<AuthEntity>> login({required Map<String, dynamic> body});

  Future<ApiResponse<AuthEntity>> otp({required Map<String, dynamic> body});

  Future<ApiResponse<AuthEntity>> otpVerify({
    required Map<String, dynamic> body,
  });

  Future<ApiResponse<AuthEntity>> resetPassword({
    required Map<String, dynamic> body,
  });

  Future<ApiResponse<AuthEntity>> validateToken({
    required Map<String, dynamic> body,
  });

  Future<ApiResponse<RefreshEntity>> refreshToken({
    required Map<String, dynamic> body,
  });

  Future<ApiResponse<AuthEntity>> changePassword({
    required Map<String, dynamic> body,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<ApiResponse<AuthEntity>> login({
    required Map<String, dynamic> body,
  }) async {
    final response = await ApiClient.postData<AuthEntity>(
      endpoint: ApiConstants.login,
      body: body,
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<ApiResponse<AuthEntity>> changePassword({
    required Map<String, dynamic> body,
  }) async {
    final response = await ApiClient.postData<AuthEntity>(
      endpoint: ApiConstants.changePassword,
      body: body,
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<ApiResponse<AuthEntity>> otp({
    required Map<String, dynamic> body,
  }) async {
    final response = await ApiClient.postData<AuthEntity>(
      endpoint: ApiConstants.otp,
      body: body,
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<ApiResponse<AuthEntity>> otpVerify({
    required Map<String, dynamic> body,
  }) async {
    final response = await ApiClient.postData<AuthEntity>(
      endpoint: ApiConstants.otpVerify,
      body: body,
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<ApiResponse<RefreshEntity>> refreshToken({
    required Map<String, dynamic> body,
  }) async {
    final response = await ApiClient.postData<RefreshEntity>(
      endpoint: ApiConstants.refreshToken,
      body: body,
      fromJsonT: (data) => RefreshModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<ApiResponse<AuthEntity>> resetPassword({
    required Map<String, dynamic> body,
  }) async {
    final response = await ApiClient.postData<AuthEntity>(
      endpoint: ApiConstants.resetPassword,
      body: body,
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<ApiResponse<AuthEntity>> validateToken({
    required Map<String, dynamic> body,
  }) async {
    final response = await ApiClient.postData<AuthEntity>(
      endpoint: ApiConstants.validateToken,
      body: body,
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }
}
