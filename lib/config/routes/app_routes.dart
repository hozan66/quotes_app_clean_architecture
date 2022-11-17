// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Blocs
import '../../features/random_quote/presentation/controllers/random_quote_cubit/random_quote_cubit.dart';

// Screens
import '../../features/random_quote/presentation/screens/quote_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

// Core
import '../../core/utils/app_strings.dart';

// App Injections
import '../../app_injections.dart';

class Routes {
  static const String initialRoute = '/';

  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (BuildContext context) =>
                serviceLocator<RandomQuoteCubit>(),
            child: const QuoteScreen(),
          ),
        );
      default:
        return undefinedRoute();
    }
  }

  // =====================================
  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
