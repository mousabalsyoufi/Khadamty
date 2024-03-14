

import 'package:dartz/dartz.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../data/model/verify_mobile_number_model.dart';
import '../repository/verify_mobile_number_repository.dart';

// Verify Mobile Number useCase to link with instance from repository
class VerifyMobileNumberUseCase extends UseCase<ApiResponse<VerifyMobileNumberModel>, VerifyMobileNumberUseCaseParams> {
  final VerifyMobileNumberRepository? _verifyMobileNumberRepository;

  VerifyMobileNumberUseCase(this._verifyMobileNumberRepository);

  @override
  Future<Either<dynamic, ApiResponse<VerifyMobileNumberModel>>> call(VerifyMobileNumberUseCaseParams params) {
    return _verifyMobileNumberRepository!.verifyMobileNumber(mobileNumber: params.mobileNumber);
  }
}

class VerifyMobileNumberUseCaseParams {
  final String mobileNumber;
  VerifyMobileNumberUseCaseParams({required this.mobileNumber});
}

