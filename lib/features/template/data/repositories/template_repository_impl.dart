import 'package:dartz/dartz.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../domain/entities/template_entitiy.dart';
import '../../domain/repositories/template_repository.dart';
import '../datasources/template_local_data_source.dart';
import '../datasources/template_remote_data_source.dart';

class TemplateRepositoryImpl extends TemplateRepository {
  final NetworkInfo networkInfo;
  final TemplateRemoteDataSource remoteDataSource;
  final TemplateLocalDataSource localDataSource;
  TemplateRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, TemplateEntity>> getTemplate(
      {required TemplateParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTemplate = await remoteDataSource.getTemplate(params);
        localDataSource.cacheTemplate(remoteTemplate);
        return Right(remoteTemplate);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localTemplate = await localDataSource.getLastTemplate();
        return Right(localTemplate);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
