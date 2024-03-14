import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for guest home Repository
abstract class GuestHomeRepository {

  Future<Either<dynamic,ApiResponse<List<CategoryModel>>>> getCategories();
}