// Packages
import 'package:shared_preferences/shared_preferences.dart';

// Core
import '../../../../core/utils/app_strings.dart';

abstract class BaseLangLocalDataSource {
  Future<bool> changeLang({required String langCode});

  Future<String> getSavedLang();
}

class LangLocalDataSourceImpl implements BaseLangLocalDataSource {
  final SharedPreferences sharedPreferences;

  LangLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.locale, langCode);

  @override
  Future<String> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)!
          : AppStrings.englishCode;
}
