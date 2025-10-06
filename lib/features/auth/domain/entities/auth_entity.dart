// bin_management_lift_entity.dart

class AuthEntity {
  final String? id;
  final String? name;
  final String? email;
  final Map<String, bool>? privileges;
  final String? profilePicture;
  final String? role;
  final String? userType;
  final String? token;
  final String? refreshToken;
  final String? contractingCompanyId;
  final String? tenantId;
  final int? roleId;

  const AuthEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.privileges,
    required this.profilePicture,
    required this.role,
    required this.userType,
    required this.token,
    required this.refreshToken,
    required this.contractingCompanyId,
    required this.tenantId,
    required this.roleId,
  });
}
