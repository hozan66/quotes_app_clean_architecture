// Packages
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Core
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';

// Models
import '../models/quote_model.dart';

// Dealing with models
abstract class BaseRandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<bool> saveCacheQuote(QuoteModel quoteModel);
}

class RandomQuoteLocalDataSourceImpl implements BaseRandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() async {
    final String? jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      //We need this line to be future
      final QuoteModel cacheRandomQuote =
          await Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  // Future<void>
  Future<bool> saveCacheQuote(QuoteModel quote) async {
    return await sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quote));
  }
}
