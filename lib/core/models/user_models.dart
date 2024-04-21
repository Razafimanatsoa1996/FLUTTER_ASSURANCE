import 'package:flutter_assurance/core/entities/user_entities.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserModel {
  @Id()
  int? id;
  final String? userId;
  final String? email;
  final String? name;

  UserModel({
    this.id,
    this.userId,
    this.email,
    this.name,
  });

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        userId: entity.userId,
        email: entity.email,
        name: entity.name,
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'email': email,
        'name': name,
      };
}
