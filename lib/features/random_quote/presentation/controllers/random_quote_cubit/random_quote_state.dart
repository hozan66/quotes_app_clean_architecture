part of 'random_quote_cubit.dart';

@immutable
abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object?> get props => [];
}

class RandomQuoteInitialState extends RandomQuoteState {}

class RandomQuoteLoadingState extends RandomQuoteState {}

class RandomQuoteLoadedState extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteLoadedState(this.quote);

  @override
  List<Object?> get props => [quote];
}

class RandomQuoteErrorState extends RandomQuoteState {
  final String error;
  const RandomQuoteErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
