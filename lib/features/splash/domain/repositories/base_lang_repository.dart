// Packages
import 'package:dartz/dartz.dart';

// Core
import '../../../../core/error/failures.dart';

abstract class BaseLangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});

  Future<Either<Failure, String>> getSavedLang();
}
