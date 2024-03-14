import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/guest_home_repository.dart';
import '../data_source/categories_provider/guest_categories_api_imp.dart';

// implementation guest home repository
class GuestHomeRepositoryImp implements GuestHomeRepository {
  final GuestCategoriesApiImp categoriesApiImp;

  GuestHomeRepositoryImp({
    required this.categoriesApiImp,
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
}
