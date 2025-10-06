// bin_management_lift_model.dart

import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.id,
    required super.name,
    required super.email,
    required super.privileges,
    required super.profilePicture,
    required super.role,
    required super.userType,
    required super.token,
    required super.roleId,
    required super.refreshToken,
    required super.contractingCompanyId,
    required super.tenantId,
  });

  factory AuthModel.fromJson({required Map<String, dynamic> json}) {
    return AuthModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      privileges: Map<String, bool>.from(json['privileges'] as Map),
      profilePicture: json['profilePicture'],
      role: json['role'],
      userType: json['userType'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      roleId: json['roleId'],
      contractingCompanyId: json['contractingCompanyId'],
      tenantId: json['tenantId'],
    );
  }
}
