// Packages
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';

// Core
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

// Models
import '../models/quote_model.dart';

// Entities
import '../../domain/entities/quote.dart';

// Repositories
import '../../domain/repositories/base_quote_repository.dart';

// Data Sources
import '../data_sources/random_quote_local_data_source.dart';
import '../data_sources/random_quote_remote_data_source.dart';

class QuoteRepositoryImpl implements BaseQuoteRepository {
  final BaseNetworkInfo baseNetworkInfo;
  final BaseRandomQuoteRemoteDataSource baseRandomQuoteRemoteDataSource;
  final BaseRandomQuoteLocalDataSource baseRandomQuoteLocalDataSource;

  QuoteRepositoryImpl({
    required this.baseNetworkInfo,
    required this.baseRandomQuoteRemoteDataSource,
    required this.baseRandomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    log((await baseNetworkInfo.isConnected).toString());
    log('=======================');
    if (await baseNetworkInfo.isConnected) {
      try {
        final QuoteModel remoteData =
            await baseRandomQuoteRemoteDataSource.getRandomQuote();

        // Storing remoteData into local storage
        baseRandomQuoteLocalDataSource.saveCacheQuote(remoteData);

        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final QuoteModel localData =
            await baseRandomQuoteLocalDataSource.getLastRandomQuote();
        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}

/*
if (is connected) {get data from api}
else {get data from cache}
*/
