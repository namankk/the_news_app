import 'package:dartz/dartz.dart';


abstract class UseCase<Type>{
  Future<Either<Error,Type>> call();
}