import 'package:dartz/dartz.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../domain/entities/post_entitiy.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl extends PostRepository {
  final NetworkInfo networkInfo;
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  PostRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, PostEntity>> getPost(
      {required PostParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remotePost = await remoteDataSource.getPost(params);
        localDataSource.cachePost(remotePost);
        return Right(remotePost);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localPost = await localDataSource.getLastPost();
        return Right(localPost);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
