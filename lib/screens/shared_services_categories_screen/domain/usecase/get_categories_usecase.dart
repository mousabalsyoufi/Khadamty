// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/repository/shared_services_categories_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// getcategories useCase to link with instance from repository
class GetCategoriesUseCase
    extends UseCase<ApiResponse<List<CategoryModel>>, NoParams> {
  final SharedServicesCategoriesRepositoryImp? _sharedServicesCategoriesRepositoryImp;

  GetCategoriesUseCase(this._sharedServicesCategoriesRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<List<CategoryModel>>>> call(
      NoParams params) {
    return _sharedServicesCategoriesRepositoryImp!.getCategories();
  }
}
