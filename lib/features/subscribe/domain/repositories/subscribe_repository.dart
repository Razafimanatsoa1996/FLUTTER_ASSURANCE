
import 'package:dartz/dartz.dart';
import 'package:flutter_assurance/core/error/failure.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/suscribeData.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/user.dart';

abstract class SubscribeRepository {
  Future<Either<Failure,SubscribeDataResponse>> sendSuscribe(User user);
  Future<Either<Failure,void>> save(SubscribeDataResponse data);
}
