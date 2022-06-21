import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.email,
    required this.id,

  });


  final String email;
  final String id;


  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(

    email: json['email'] ?? "",
    id: json['id'] ?? "",

  );

  Map<String, dynamic> toJson() => <String, dynamic>{

    'email': email,
    'id': id,
  };
  factory UserEntity.empty() => const UserEntity(
    email: "",
    id: "",
  );
  @override
  List<Object?> get props => [ email,id,];
}