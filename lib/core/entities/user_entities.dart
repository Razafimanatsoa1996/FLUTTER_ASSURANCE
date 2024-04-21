import 'package:equatable/equatable.dart';
import 'package:flutter_assurance/core/models/user_models.dart';



class UserEntity extends Equatable {
  final String? userId;
  final String? email;
  final String? name;
  @override
  List<Object?> get props => [
        userId,
        email,
        name,
      ];

  const UserEntity({
    this.userId,
    this.email,
    this.name
  });

  UserEntity copyWith({
   String ? userId,
    String? email,
    String? name,
  }) {
    return UserEntity(
      userId:userId?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  factory UserEntity.fromModel(UserModel model) => UserEntity(
       userId:model.userId,
        name: model.name,
        email: model.email
      );
}
