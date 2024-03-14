// abstract Verify OTP  api call
import '../../../../../core/api_handler/response_handler.dart';
import '../../model/verify_otp_response_model.dart';

abstract class VerifyOtpApi {
  Future<ApiResponse<VerifyOtpResponseModel>> verifyOtp({
    required String otpCode,
    required String verificationId,
  });
}
