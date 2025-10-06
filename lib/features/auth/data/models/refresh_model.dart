// bin_management_lift_model.dart
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/refresh_entity.dart';

class RefreshModel extends RefreshEntity {
  const RefreshModel({
    required super.token,
    required super.refreshToken,
    required super.refreshTokenExpiration,
  });

  factory RefreshModel.fromJson({required Map<String, dynamic> json}) {
    return RefreshModel(
      token: json['token'],
      refreshToken: json['refreshToken'],
      refreshTokenExpiration: json['refreshTokenExpiration'],

    );
  }
}
