

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_comany_model.dart';
import '../../data/model/register_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/register_repository.dart';

// Register as a company useCase to link with instance from repository
class RegisterCompanyUseCase extends UseCase<ApiResponse<RegisterModel>, RegisterCompanyUseCaseParams> {
  final RegisterRepository? _registerRepository;

  RegisterCompanyUseCase(this._registerRepository);

  @override
  Future<Either<dynamic, ApiResponse<RegisterModel>>> call(RegisterCompanyUseCaseParams params) {
    return _registerRepository!.registerCompany(registerRequestModel:params.registerRequestModel);
  }
}

class RegisterCompanyUseCaseParams {
  final RegisterRequestCompanyModel registerRequestModel;
  RegisterCompanyUseCaseParams({required this.registerRequestModel});
}

