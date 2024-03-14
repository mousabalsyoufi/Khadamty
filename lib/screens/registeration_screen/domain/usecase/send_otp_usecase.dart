import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/register_repository.dart';

// Send OTP useCase to link with instance from repository
class SendOtpUseCase
    extends UseCase<ApiResponse<String>, SendOtpUseCaseParams> {
  final RegisterRepository? _registerRepository;

  SendOtpUseCase(this._registerRepository);

  @override
  Future<Either<dynamic, ApiResponse<String>>> call(
      SendOtpUseCaseParams params) {
    return _registerRepository!.sendOtp(
      phoneNumber: params.phoneNumber,
    );
  }
}

class SendOtpUseCaseParams {
  final String phoneNumber;
  SendOtpUseCaseParams({
    required this.phoneNumber,
  });
}
