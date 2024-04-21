import 'package:equatable/equatable.dart';

class SubscribeDataResponse extends Equatable {
  final String idSub;
  final String email;
  final int telephone;
  final String marque;
  final String os;
  final String dateSubscribe;


  const SubscribeDataResponse({
    required this.idSub,   
    required this.email,
    required this.telephone,
    required this.marque,
    required this.os,
    required this.dateSubscribe,
  });

  @override
  List<Object> get props => [idSub, email, telephone, marque, dateSubscribe, os];

  Map<String, dynamic> toJson() {
    return {
      'idSub':idSub,
      'email': email,
      'telephone': telephone,
      'marque': marque,
      'os': os,
      'dateSubscribe': dateSubscribe,
    };
  }

  factory SubscribeDataResponse.fromJson(Map<String, dynamic> map) {
    return SubscribeDataResponse(
       idSub:'${map['idSub']}',
      email: map['email'],
      telephone: map['telephone'],
      marque: map['marque'],
      os: map['os'],
      dateSubscribe: map['dateSubscribe'],
    );
  }
}
