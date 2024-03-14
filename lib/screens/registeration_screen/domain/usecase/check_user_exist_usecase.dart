import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/register_repository.dart';

// Check User Exist useCase to link with instance from repository
class CheckUserExistUseCase
    extends UseCase<ApiResponse<String>, CheckUserExistUseCaseParams> {
  final RegisterRepository? _registerRepository;

  CheckUserExistUseCase(this._registerRepository);

  @override
  Future<Either<dynamic, ApiResponse<String>>> call(
      CheckUserExistUseCaseParams params) {
    return _registerRepository!.checkUserExist(
      email: params.email,
    );
  }
}

class CheckUserExistUseCaseParams {
  final String email;
  CheckUserExistUseCaseParams({
    required this.email,
  });
}
