

import 'package:dartz/dartz.dart';
import '../../data/model/forget_password_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/forget_password_repository.dart';

// Forget Password  useCase to link with instance from repository
class ForgetPasswordUseCase extends UseCase<ApiResponse<ForgetPasswordModel>, ForgetPasswordUseCaseParams> {
  final ForgetPasswordRepository? _forgetPasswordRepository;

  ForgetPasswordUseCase(this._forgetPasswordRepository);

  @override
  Future<Either<dynamic, ApiResponse<ForgetPasswordModel>>> call(ForgetPasswordUseCaseParams params) {
    return _forgetPasswordRepository!.forgetPassword(email: params.email);
  }
}

class ForgetPasswordUseCaseParams {
  final String email;
  ForgetPasswordUseCaseParams({required this.email});
}

