import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for user shared services categories Repository
abstract class SharedServicesCategoriesRepository {

  Future<Either<dynamic,ApiResponse<List<CategoryModel>>>> getCategories();
  Future<Either<dynamic,ApiResponse<List<CategoryServiceModel>>>> getCategorySrevices({required String id});
  Future<Either<dynamic,ApiResponse<List<CategoryServiceModel>>>> getOffers();

}