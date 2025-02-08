import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

class NoParam {}

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}
