import '../../../../../core/api_handler/response_handler.dart';
import '../../model/forget_password_model.dart';

// abstract Verify Mobile Number  api call
abstract class ForgetPasswordApi {
  Future<ApiResponse<ForgetPasswordModel>> forgetPassword(
      {required String email});
}
