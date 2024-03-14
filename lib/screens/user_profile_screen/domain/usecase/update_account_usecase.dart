import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/models/response.model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/repository/user_profile_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// Update Account info useCase to link with instance from repository
class UpdateAccountUseCase
    extends UseCase<ApiResponse<SuccessResponseModel>, UpdateAccountUseCaseParams> {
  final UserProfileRepository? _userProfileRepository;

  UpdateAccountUseCase(this._userProfileRepository);

  @override
  Future<Either<dynamic, ApiResponse<SuccessResponseModel>>> call(
      UpdateAccountUseCaseParams params) {
    return _userProfileRepository!.updateAccount(accountModel: params.accountModel, id: params.id);
  }
}

class UpdateAccountUseCaseParams {
  final AccountModel accountModel;
  final int id;
  UpdateAccountUseCaseParams({required this.accountModel,required this.id});
}
