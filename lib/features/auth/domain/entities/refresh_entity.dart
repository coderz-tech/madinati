// bin_management_lift_entity.dart

class RefreshEntity {
  final String token;
  final String refreshToken;
  final String refreshTokenExpiration;


  const RefreshEntity({
    required this.token,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });
}
