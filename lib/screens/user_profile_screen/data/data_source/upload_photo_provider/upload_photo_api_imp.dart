import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/delete_account_provider/delete_account_api.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/upload_photo_provider/upload_photo_api.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/upload_photo_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// Upload Photo api call implementation
class UploadPhotoApiImp extends BaseApiProvider implements UploadPhotoApi {
  @override
  Future<ApiResponse<String>> uploadPhoto(
      {required UploadPhotoModel requestModel}) async {
    ApiResponse<String>? result;
    Response? response;
    try {
      final params = requestModel.toMap();
      response = await client.post(
        Urls.uploadPhoto,
        options: await getRequestWithToken(),
        data: params,
      );
      result =
          ApiResponse.completed(response.data[ApiKeys.data][ApiKeys.result]);
      result.message = response.data[ApiKeys.message];
      result.code = response.data[ApiKeys.code];
    } catch (error) {
      try {
        error is DioError
            ? customExceptionHandler(error, -1)
            : customExceptionHandler(error, response);
      } catch (forcedException) {
        result = ApiResponse.error(forcedException.toString());
      }
    }
    return result!;
  }
}
