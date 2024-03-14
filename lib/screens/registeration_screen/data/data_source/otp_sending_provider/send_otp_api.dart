
// abstract Send OTP  api call
import '../../../../../core/api_handler/response_handler.dart';

abstract class SendOtpApi {
  Future<ApiResponse<String>> sendOtp({
    required String phoneNumber,
  });
}
