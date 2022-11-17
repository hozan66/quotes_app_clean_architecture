// Packages
import 'package:dartz/dartz.dart';

// Core
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/base_use_case.dart';

// Repositories
import '../repositories/base_lang_repository.dart';

class GetSavedLangUseCase implements BaseUseCase<String, NoParams> {
  final BaseLangRepository baseLangRepository;

  GetSavedLangUseCase({required this.baseLangRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await baseLangRepository.getSavedLang();
}
