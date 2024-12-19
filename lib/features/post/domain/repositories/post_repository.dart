import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/post_entitiy.dart';

abstract class PostRepository {
  Future<Either<Failure, PostEntity>> getPost({required PostParams params});
}
