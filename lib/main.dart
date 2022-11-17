// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// App Injections
import 'package:quotes_app_clean_architecture/app_injections.dart';

// App Bloc Observer
import 'package:quotes_app_clean_architecture/app_bloc_observer.dart';

// Quote App
import 'package:quotes_app_clean_architecture/quote_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInjections().init();

  Bloc.observer = AppBlocObserver();
  runApp(const QuoteApp());
}
