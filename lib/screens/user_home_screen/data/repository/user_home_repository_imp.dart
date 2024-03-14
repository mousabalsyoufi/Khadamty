import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/data/data_source/categories_provider/user_categories_api_imp.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/domain/repository/user_home_repository.dart';
import '../../../../core/api_handler/response_handler.dart';

// implementation user home repository
class UserHomeRepositoryImp implements UserHomeRepository {
  final UserCategoriesApiImp categoriesApiImp;

  UserHomeRepositoryImp({
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
