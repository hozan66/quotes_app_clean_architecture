// Core
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';

// Models
import '../models/quote_model.dart';

// Dealing with models
abstract class BaseRandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl
    implements BaseRandomQuoteRemoteDataSource {
  BaseApiConsumer baseApiConsumer;

  RandomQuoteRemoteDataSourceImpl({required this.baseApiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await baseApiConsumer.get(EndPoints.randomQuoteUrl);

    return QuoteModel.fromJson(response);
  }
}
