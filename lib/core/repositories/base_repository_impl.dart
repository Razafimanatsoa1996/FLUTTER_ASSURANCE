import 'package:dartz/dartz.dart';
import 'package:flutter_assurance/core/entities/user_entities.dart';
import 'package:flutter_assurance/core/error/failure.dart';
import 'package:flutter_assurance/core/models/user_models.dart';
import 'package:flutter_assurance/core/sources/local/local_data_source.dart';
import 'package:flutter_assurance/core/sources/remotes/remote_data_sources.dart';
import 'base_repository.dart';

class BaseRepositoryImpl extends BaseRepository {
  final LocalDataSource local;
  final RemoteDataSource remote;

  BaseRepositoryImpl(
    this.local,
    this.remote,
  );

  @override
  Future<Either<Failure, List<UserEntity>>> fetchLocal(String step) async {
    try {
      final result = await local.fetch(step);
      return Right(result.map((e) => UserEntity.fromModel(e)).toList());
    } catch (_) {
      return Left(LocalCacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> fetchRemote(
      String url, String step) async {
    try {
      final res = await remote.get(url);
      final temps = (res.data as List).map((e) => e['label']).toList();
      return Right(
          temps.map((e) => UserEntity(userId: e, email: e.email,name:e.name)).toList());
    } catch (_) {
      return Left(LocalCacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> updateData(List<UserEntity> data) async {
    try {
      final temps = data.map((e) => UserModel.fromEntity(e)).toList();
      final result = await local.insertAll(temps);
      return Right(result);
    } catch (_) {
      return Left(LocalCacheFailure());
    }
  }
}
