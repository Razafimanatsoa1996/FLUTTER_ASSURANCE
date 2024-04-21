import 'package:dartz/dartz.dart';
import 'package:flutter_assurance/core/entities/user_entities.dart';
import 'package:flutter_assurance/core/error/failure.dart';

abstract class BaseRepository {

  Future<Either<Failure, List<UserEntity>>> fetchLocal(String step);

  Future<Either<Failure, List<UserEntity>>> fetchRemote(String url, String step);

  Future<Either<Failure, void>> updateData(List<UserEntity> data);
  
}
 