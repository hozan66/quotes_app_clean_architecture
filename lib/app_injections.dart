// Packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Core
import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer_impl.dart';
import 'core/network/network_info.dart';

// Data Sources
import 'features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'features/splash/data/data_sources/lang_local_data_source.dart';

// Repositories
import 'features/random_quote/data/repositories/quote_repository_impl.dart';
import 'features/random_quote/domain/repositories/base_quote_repository.dart';
import 'features/splash/data/repositories/lang_repository_impl.dart';
import 'features/splash/domain/repositories/base_lang_repository.dart';

// Use Cases
import 'features/random_quote/domain/use_cases/get_random_quote_use_case.dart';
import 'features/splash/domain/use_cases/change_lang_use_case.dart';
import 'features/splash/domain/use_cases/get_saved_lang_use_case.dart';

// Blocs
import 'features/random_quote/presentation/controllers/random_quote_cubit/random_quote_cubit.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

// Each feature will have a separated Injections file to be more organized.
class AppInjections {
  Future<void> init() async {
    //! Features

    //! Blocs
    // serviceLocator.registerFactory => will create a new object each time we call it.
    serviceLocator.registerFactory<RandomQuoteCubit>(
        () => RandomQuoteCubit(getRandomQuoteUseCase: serviceLocator()));
    serviceLocator.registerFactory<LocaleCubit>(() => LocaleCubit(
        getSavedLangUseCase: serviceLocator(),
        changeLangUseCase: serviceLocator()));

    //! Use Cases
    // registerLazySingleton => it creates a single object when required to use
    // registerSingleton => it creates a single object when once initiate it
    serviceLocator.registerLazySingleton(
        () => GetRandomQuoteUseCase(baseQuoteRepository: serviceLocator()));
    serviceLocator.registerLazySingleton<GetSavedLangUseCase>(
        () => GetSavedLangUseCase(baseLangRepository: serviceLocator()));
    serviceLocator.registerLazySingleton<ChangeLangUseCase>(
        () => ChangeLangUseCase(baseLangRepository: serviceLocator()));

    //! Repositories
    serviceLocator
        .registerLazySingleton<BaseQuoteRepository>(() => QuoteRepositoryImpl(
              baseNetworkInfo: serviceLocator(),
              baseRandomQuoteRemoteDataSource: serviceLocator(),
              baseRandomQuoteLocalDataSource: serviceLocator(),
            ));
    serviceLocator.registerLazySingleton<BaseLangRepository>(
        () => LangRepositoryImpl(baseLangLocalDataSource: serviceLocator()));

    //! Data Sources
    serviceLocator.registerLazySingleton<BaseRandomQuoteLocalDataSource>(() =>
        RandomQuoteLocalDataSourceImpl(sharedPreferences: serviceLocator()));
    serviceLocator.registerLazySingleton<BaseRandomQuoteRemoteDataSource>(() =>
        RandomQuoteRemoteDataSourceImpl(baseApiConsumer: serviceLocator()));
    serviceLocator.registerLazySingleton<BaseLangLocalDataSource>(
        () => LangLocalDataSourceImpl(sharedPreferences: serviceLocator()));

    //! Core
    serviceLocator
        .registerLazySingleton<BaseNetworkInfo>(() => NetworkInfoImpl());
    serviceLocator.registerLazySingleton<BaseApiConsumer>(
        () => DioConsumerImpl(client: serviceLocator()));

    //! External
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    serviceLocator.registerLazySingleton(() => sharedPreferences);
    // serviceLocator.registerLazySingleton(() => http.Client());
    serviceLocator.registerLazySingleton(() => AppInterceptors());
    // LogInterceptor for printing purposes
    serviceLocator.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    // serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
    serviceLocator.registerLazySingleton(() => Dio());
  }
}
