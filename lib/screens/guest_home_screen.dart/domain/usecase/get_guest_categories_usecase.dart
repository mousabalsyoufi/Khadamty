// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/guest_home_repository.dart';

// get categories useCase to link with instance from repository
class GetGuestCategoriesUseCase
    extends UseCase<ApiResponse<List<CategoryModel>>, NoParams> {
  final GuestHomeRepository? _guestHomeRepository;

  GetGuestCategoriesUseCase(this._guestHomeRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<CategoryModel>>>> call(
      NoParams params) {
    return _guestHomeRepository!.getCategories();
  }
}
