import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/template_entitiy.dart';
import '../repositories/template_repository.dart';

class GetTemplate {
  final TemplateRepository repository;

  GetTemplate({required this.repository});

  Future<Either<Failure, TemplateEntity>> call(
      {required TemplateParams params}) {
    return repository.getTemplate(params: params);
  }
}
