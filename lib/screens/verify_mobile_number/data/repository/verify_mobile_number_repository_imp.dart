import 'package:dartz/dartz.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/verify_mobile_number_repository.dart';
import '../data_source/verify_mobile_number_provider/verify_mobile_number_api_imp.dart';
import '../model/verify_mobile_number_model.dart';

// implementation login repository
class VerifyMobileNumberRepositoryImp implements VerifyMobileNumberRepository {
  final VerifyMobileNumberApiImp _verifyMobileNumberImp;

  VerifyMobileNumberRepositoryImp(this._verifyMobileNumberImp);

  @override
  Future<Either<dynamic, ApiResponse<VerifyMobileNumberModel>>>
      verifyMobileNumber({required String mobileNumber}) async {
    // TODO Check Left Value here Left(error)
    ApiResponse<VerifyMobileNumberModel> result;
    try {
      result = await _verifyMobileNumberImp.verifyMobileNumber(
          mobileNumber: mobileNumber);
      return Right(result);
    } catch (error) {
      return Left(error);
    }
  }
}
