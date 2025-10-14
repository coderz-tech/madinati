import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    String? name,
    String? idNumber,
    String? dob,
    String? nationality,
    String? phoneNumber,
    String? role,
  }) : super(
          name: name,
          dob: dob,
          idNumber: idNumber,
          nationality: nationality,
          phoneNumber: phoneNumber,
          role: role,
        );

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      name: json['name'],
      idNumber: json['idNumber'],
      dob: json['dob'],
      nationality: json['nationality'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }
}
