import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for user home Repository
abstract class UserHomeRepository {

  Future<Either<dynamic,ApiResponse<List<CategoryModel>>>> getCategories();
}