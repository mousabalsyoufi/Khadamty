

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_request_model.dart';
import '../../data/model/register_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/register_repository.dart';

// Register useCase to link with instance from repository
class RegisterUseCase extends UseCase<ApiResponse<RegisterModel>, RegisterUseCaseParams> {
  final RegisterRepository? _registerRepository;

  RegisterUseCase(this._registerRepository);

  @override
  Future<Either<dynamic, ApiResponse<RegisterModel>>> call(RegisterUseCaseParams params) {
    return _registerRepository!.register(registerRequestModel:params.registerRequestModel);
  }
}

class RegisterUseCaseParams {
  final RegisterRequestModel registerRequestModel;
  RegisterUseCaseParams({required this.registerRequestModel});
}

