import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/easer_personal_data_repository.dart';

// Get Easer Account info useCase to link with instance from repository
class GetEaserAccountUseCase
    extends UseCase<ApiResponse<AccountModel>, NoParams> {
  final EaserPersonalDataRepository? _userPersonalDataRepository;

  GetEaserAccountUseCase(this._userPersonalDataRepository);

  @override
  Future<Either<dynamic, ApiResponse<AccountModel>>> call(
      NoParams params) {
    return _userPersonalDataRepository!.getAccount();
  }
}