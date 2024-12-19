import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/post_entitiy.dart';
import '../repositories/post_repository.dart';

class GetPost {
  final PostRepository repository;

  GetPost({required this.repository});

  Future<Either<Failure, PostEntity>> call({required PostParams params}) {
    return repository.getPost(params: params);
  }
}
