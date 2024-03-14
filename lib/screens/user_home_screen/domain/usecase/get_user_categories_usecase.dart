// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/domain/repository/user_home_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// getcategories useCase to link with instance from repository
class GetUserCategoriesUseCase
    extends UseCase<ApiResponse<List<CategoryModel>>, NoParams> {
  final UserHomeRepository? _userHomeRepository;

  GetUserCategoriesUseCase(this._userHomeRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<CategoryModel>>>> call(
      NoParams params) {
    return _userHomeRepository!.getCategories();
  }
}
