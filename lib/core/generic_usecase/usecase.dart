import 'package:dartz/dartz.dart';


// abstract UseCase
abstract class UseCase<Type,Params> {
  Future<Either<dynamic,Type>> call(Params params);
}
class NoParams{}