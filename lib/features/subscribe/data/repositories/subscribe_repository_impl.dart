import 'package:dartz/dartz.dart';
import 'package:flutter_assurance/core/error/failure.dart';
import 'package:flutter_assurance/features/subscribe/data/data_sources/local/subscribe_local_data_source.dart';
import 'package:flutter_assurance/features/subscribe/data/data_sources/remote/subscribe_remote_data_source.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/suscribeData.dart';
import 'package:flutter_assurance/features/subscribe/domain/entities/user.dart';
import 'package:flutter_assurance/features/subscribe/domain/repositories/subscribe_repository.dart';
import 'package:flutter_assurance/core/error/exceptions.dart';

class SubscribeRepositoryImpl implements SubscribeRepository {
  final SubscribeRemoteDataSource source;
  final SubscribeLocalDataSource local;

  const SubscribeRepositoryImpl({required this.source, required this.local});

  @override
  Future<Either<Failure, SubscribeDataResponse>> sendSuscribe(User user) async {
    try {
      final res = await source.sendSuscribe(user);

      return Right(res);
    } on ServerException {
      return Left(LocalCacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> save(SubscribeDataResponse data) async {
    try {
      final res = await local.save(data);

      return Right(res);
    } on ServerException {
      return Left(LocalCacheFailure());
    }
  }
}
