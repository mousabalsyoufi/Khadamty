import '../../../../../core/api_handler/response_handler.dart';
import '../../model/login_model.dart';

// abstract login  api call
abstract class LoginApi {
  Future<ApiResponse<LoginModel>> login(
      {required String username, required String password});
}
