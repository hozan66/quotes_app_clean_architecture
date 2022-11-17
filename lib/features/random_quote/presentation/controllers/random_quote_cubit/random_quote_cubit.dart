// Packages
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Core
import '../../../../../core/error/failures.dart';
import '../../../../../core/use_cases/base_use_case.dart';
import '../../../../../core/utils/app_strings.dart';

// Entities
import '../../../domain/entities/quote.dart';

// Use Cases
import '../../../domain/use_cases/get_random_quote_use_case.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  GetRandomQuoteUseCase getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitialState());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteLoadingState());

    final Either<Failure, Quote> result =
        // await getRandomQuoteUseCase.call(NoParams());
        await getRandomQuoteUseCase(NoParams()); // Callable class

    log(result.toString());
    result.fold((leftFailure) {
      return emit(RandomQuoteErrorState(_mapFailureToMessage(leftFailure)));
    }, (rightQuote) {
      return emit(RandomQuoteLoadedState(rightQuote));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedError;
    }
  }
}
