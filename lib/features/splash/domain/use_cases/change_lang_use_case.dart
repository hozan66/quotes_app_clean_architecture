// Packages
import 'package:dartz/dartz.dart';

// Core
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/base_use_case.dart';

// Repositories
import '../repositories/base_lang_repository.dart';

class ChangeLangUseCase implements BaseUseCase<bool, String> {
  final BaseLangRepository baseLangRepository;

  ChangeLangUseCase({required this.baseLangRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await baseLangRepository.changeLang(langCode: langCode);
}
