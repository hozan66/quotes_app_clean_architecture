// Packages
import 'package:dartz/dartz.dart';

// Core
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

// Repositories
import '../../domain/repositories/base_lang_repository.dart';

// Data Sources
import '../data_sources/lang_local_data_source.dart';

class LangRepositoryImpl implements BaseLangRepository {
  final BaseLangLocalDataSource baseLangLocalDataSource;

  LangRepositoryImpl({required this.baseLangLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final bool langIsChanged =
          await baseLangLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final String langCode = await baseLangLocalDataSource.getSavedLang();
      return Right(langCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
