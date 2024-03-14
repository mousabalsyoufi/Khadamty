
// abstract delete account call
import '../../../../../core/api_handler/response_handler.dart';

abstract class DeleteAccountApi {
  Future<ApiResponse<String>> deleteAccount({
    required String id,
  });
}
