import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final int? telephone;
  final String? marque;
  final String? os;
  final String? dateSubscribe;

  const User({
    this.email,
    this.telephone,
    this.marque,
    this.os,
    this.dateSubscribe,
  });

  @override
  List<Object?> get props => [email, telephone, marque, dateSubscribe, os];

  User copyWith({
    String? mail,
    int? phonNumber,
    String? marque,
    String? os,
    String? dateSubscribe,
  }) {
    return User(
      email: email ?? email,
      telephone: telephone ?? telephone,
      marque: marque ?? marque,
      os: os ?? os,
      dateSubscribe: dateSubscribe ?? dateSubscribe,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'telephone': telephone,
      'marque': marque,
      'os': os,
      'dateSubscribe': dateSubscribe,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      telephone: map['telephone'],
      marque: map['marque'],
      os: map['os'],
      dateSubscribe: map['dateSubscribe'],
    );
  }
}
