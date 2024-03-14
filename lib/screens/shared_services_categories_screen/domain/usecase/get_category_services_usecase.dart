// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/repository/shared_services_categories_repository_imp.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// getcategory services useCase to link with instance from repository
class GetCategoryServicesUseCase extends UseCase<
    ApiResponse<List<CategoryServiceModel>>, CategoriesServicesParams> {
  final SharedServicesCategoriesRepositoryImp? _categoriesRepositoryImp;

  GetCategoryServicesUseCase(this._categoriesRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<List<CategoryServiceModel>>>> call(
      CategoriesServicesParams params) {
    return _categoriesRepositoryImp!.getCategorySrevices(id: params.id);
  }
}

class CategoriesServicesParams {
  String id;
  CategoriesServicesParams({required this.id});
}
