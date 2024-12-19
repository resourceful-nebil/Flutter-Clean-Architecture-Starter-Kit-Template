import 'package:dartz/dartz.dart';
import 'package:happytech_clean_architecture/core/connection/network_info.dart';
import 'package:happytech_clean_architecture/core/errors/expentions.dart';
import 'package:happytech_clean_architecture/core/errors/failure.dart';
import 'package:happytech_clean_architecture/core/params/params.dart';
import 'package:happytech_clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:happytech_clean_architecture/features/user/data/datasources/user_remote_data_source.dart';
import 'package:happytech_clean_architecture/features/user/domain/entities/user_entitiy.dart';
import 'package:happytech_clean_architecture/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  UserRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, UserEntity>> getUser(
      {required UserParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSource.getUser(params);
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
