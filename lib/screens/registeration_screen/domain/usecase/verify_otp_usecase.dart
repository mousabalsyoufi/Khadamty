import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../data/model/verify_otp_response_model.dart';
import '../repository/register_repository.dart';

// verify OTP useCase to link with instance from repository
class VerifyOtpUseCase extends UseCase<ApiResponse<VerifyOtpResponseModel>,
    VerifyOtpUseCaseParams> {
  final RegisterRepository? _registerRepository;

  VerifyOtpUseCase(this._registerRepository);

  @override
  Future<Either<dynamic, ApiResponse<VerifyOtpResponseModel>>> call(
      VerifyOtpUseCaseParams params) {
    return _registerRepository!.verifyOtp(
      otpCode: params.otpCode,
      verificationId: params.verificationId,
    );
  }
}

class VerifyOtpUseCaseParams {
  final String otpCode;
  final String verificationId;
  VerifyOtpUseCaseParams({
    required this.otpCode,
    required this.verificationId,
  });
}
