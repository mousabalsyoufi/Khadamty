import '../../../../../core/api_handler/response_handler.dart';
import '../../model/verify_mobile_number_model.dart';

// abstract Verify Mobile Number  api call
abstract class VerifyMobileNumberApi {
  Future<ApiResponse<VerifyMobileNumberModel>> verifyMobileNumber(
      {required String mobileNumber});
}
