import 'package:flutter_assurance/core/error/failure.dart';
import 'package:flutter_assurance/core/utils/use_case.dart';
import 'package:flutter_assurance/features/subscribe/data/data_sources/remote/subscribe_remote_data_source.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/suscribeData.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/user.dart';

class SendSubscribe implements UseCase<SubscribeDataResponse, User> {
  final SubscribeRemoteDataSource repository;

  const SendSubscribe({
    required this.repository,
  });

  @override
    Future<Either<Failure,SubscribeDataResponse>> call(User data) async {

    try {
      final result =await repository.sendSuscribe(data);
      return Right(result);
    } catch (e) {
      return Left('Failed to send data' as Failure);
    }
  }

}
