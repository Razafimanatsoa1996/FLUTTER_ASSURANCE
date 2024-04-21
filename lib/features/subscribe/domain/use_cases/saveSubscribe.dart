import 'package:flutter_assurance/core/error/failure.dart';
import 'package:flutter_assurance/core/utils/use_case.dart';
import 'package:flutter_assurance/features/subscribe/data/data_sources/local/subscribe_local_data_source.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/suscribeData.dart';
import 'package:dartz/dartz.dart';

class SaveSubscribe implements UseCase<void, SubscribeDataResponse> {
  final SubscribeLocalDataSource repository;

  const SaveSubscribe({
    required this.repository,
  });

  @override
    Future<Either<Failure,void>> call(SubscribeDataResponse data) async {

    try {
      final result =await repository.save(data);
      return Right(result);
    } catch (e) {
      return Left('Failed to send data' as Failure);
    }
  }

}
