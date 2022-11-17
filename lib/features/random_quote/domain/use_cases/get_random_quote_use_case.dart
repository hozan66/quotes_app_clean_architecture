// Packages
import 'package:dartz/dartz.dart';

// Core
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/base_use_case.dart';

// Entities
import '../entities/quote.dart';

// Repositories
import '../repositories/base_quote_repository.dart';

// Callable class
class GetRandomQuoteUseCase implements BaseUseCase<Quote, NoParams> {
  final BaseQuoteRepository baseQuoteRepository;

  GetRandomQuoteUseCase({required this.baseQuoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return baseQuoteRepository.getRandomQuote();
  }
}
