// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Core
import '../../../../core/utils/app_colors.dart';
import 'package:quotes_app_clean_architecture/core/widgets/error_widget.dart'
    as error_widget;

// Blocs
import 'package:quotes_app_clean_architecture/features/random_quote/presentation/controllers/random_quote_cubit/random_quote_cubit.dart';
import '../../../splash/presentation/cubit/locale_cubit.dart';

// Config
import '../../../../config/locale/app_localizations.dart';

// Widgets
import '../widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  dynamic _getRandomQuote() {
    return BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  }

  @override
  void initState() {
    super.initState();

    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.translate_outlined,
          color: AppColors.primary,
        ),
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocaleCubit>(context).toArabic();
          } else {
            BlocProvider.of<LocaleCubit>(context).toEnglish();
          }
        },
      ),
      title: Text(AppLocalizations.of(context)!.translate('app_name')!),
    );
    return RefreshIndicator(
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
      onRefresh: () {
        return _getRandomQuote();
      },
    );
  }

  Widget _buildBodyContent() => BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: (context, state) {
          if (state is RandomQuoteLoadingState) {
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
                // itemBuilder: (BuildContext context, int index) {
                //   return DecoratedBox(
                //     decoration: BoxDecoration(
                //       color: index.isEven ? Colors.red : Colors.green,
                //     ),
                //   );
                // },
              ),
            );
          } else if (state is RandomQuoteErrorState) {
            return error_widget.ErrorWidget(onPress: _getRandomQuote);
          } else if (state is RandomQuoteLoadedState) {
            return Column(
              children: [
                QuoteContent(quote: state.quote),
                InkWell(
                  onTap: () {
                    _getRandomQuote();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 28.0,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
                // itemBuilder: (BuildContext context, int index) {
                //   return DecoratedBox(
                //     decoration: BoxDecoration(
                //       color: index.isEven ? Colors.red : Colors.green,
                //     ),
                //   );
                // },
              ),
            );
          }
        },
      );
}
