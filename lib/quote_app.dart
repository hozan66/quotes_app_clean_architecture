// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// App Injections
import 'package:quotes_app_clean_architecture/app_injections.dart';

// Config
import 'package:quotes_app_clean_architecture/config/routes/app_routes.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/themes/app_theme.dart';

// Core
import 'core/utils/app_strings.dart';

// Blocs
import 'features/splash/presentation/cubit/locale_cubit.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                serviceLocator.get<LocaleCubit>()..getSavedLang()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            // home: const QuoteScreen(),
            onGenerateRoute: AppRoutes.onGenerateRoute,

            // Locale settings
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
