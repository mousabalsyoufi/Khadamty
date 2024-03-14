import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/data_source/categories_provider/categories_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/data_source/category_services_provider/category_services_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/data_source/offers_provider/offers_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/domain/repository/shared_services_categories_repository.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import '../../../../core/api_handler/response_handler.dart';

// implementation shared services categories repository
class SharedServicesCategoriesRepositoryImp
    implements SharedServicesCategoriesRepository {
  final CategoriesApiImp categoriesApiImp;
  final CategoryServicesApiImp categoryServicesApiImp;
  final OffersApiImp offersApiImp;

  SharedServicesCategoriesRepositoryImp({
    required this.categoriesApiImp,
    required this.categoryServicesApiImp,
    required this.offersApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<List<CategoryModel>>>>
      getCategories() async {
    ApiResponse<List<CategoryModel>> result;
    try {
      result = await categoriesApiImp.getCategories();
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<List<CategoryServiceModel>>>>
      getCategorySrevices({required String id}) async {
    ApiResponse<List<CategoryServiceModel>> result;
    try {
      result = await categoryServicesApiImp.getServices(id: id);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<List<CategoryServiceModel>>>>
      getOffers() async {
    ApiResponse<List<CategoryServiceModel>> result;
    try {
      result = await offersApiImp.getOffers();
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
