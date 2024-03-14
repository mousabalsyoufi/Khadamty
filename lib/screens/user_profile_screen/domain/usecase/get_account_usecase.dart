import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/repository/user_profile_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// Get  Account info useCase to link with instance from repository
class GetAccountUseCase
    extends UseCase<ApiResponse<AccountModel>, GetAccountUseCaseParams> {
  final UserProfileRepository? _userProfileRepository;

  GetAccountUseCase(this._userProfileRepository);

  @override
  Future<Either<dynamic, ApiResponse<AccountModel>>> call(
      GetAccountUseCaseParams params) {
    return _userProfileRepository!.getAccount();
  }
}

class GetAccountUseCaseParams {
  GetAccountUseCaseParams();
}
