// Packages
import 'package:dartz/dartz.dart';

// Core
import '../../../../core/error/failures.dart';

// Entities
import '../entities/quote.dart';

// Contract
abstract class BaseQuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
