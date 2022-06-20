import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.email,
  });


  final String email;


  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(

    email: json['email'] ?? "",

  );

  Map<String, dynamic> toJson() => <String, dynamic>{

    'email': email,
  };
  factory UserEntity.empty() => const UserEntity(
    email: "",
  );
  @override
  List<Object?> get props => [ email,];
}