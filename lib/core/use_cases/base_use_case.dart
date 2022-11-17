// Packages
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Core
import '../error/failures.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
