
// abstractcheck user exist api call
import '../../../../../core/api_handler/response_handler.dart';

abstract class CheckUserExistApi {
  Future<ApiResponse<String>> checkUserExist({
    required String email,
  });
}
