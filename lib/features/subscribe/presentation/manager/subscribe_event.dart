import 'package:equatable/equatable.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/suscribeData.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/user.dart';


abstract class SubscribeEvent extends Equatable {
  const SubscribeEvent();

  @override
  List<Object> get props => [];
}




class UpdateUserEvent extends SubscribeEvent {
  final User user;

  const UpdateUserEvent(
     this.user,
  );

  @override
  List<Object> get props => [user];
}

class SendSusEvent extends SubscribeEvent {
  final User user;

  const SendSusEvent(
     this.user,
  );

  @override
  List<Object> get props => [user];
}

class SaveSusEvent extends SubscribeEvent {
  final SubscribeDataResponse data;

  const SaveSusEvent(
     this.data,
  );

  @override
  List<Object> get props => [data];
}

