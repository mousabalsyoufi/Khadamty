import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/shared_notifications_screen/data/model/notifications_respnse_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';
import 'notifications_api.dart';

// Notifications api call implementation
class NotificationsApiImp extends BaseApiProvider
    implements NotificationsApi {
 
  @override
  Future<ApiResponse<List<NotificationsResponseModel>>> getNotifications() async {
    ApiResponse<List<NotificationsResponseModel>>? result;
    Response? response;
    try {
      response = await client.get(
        Urls.notifications,
        options: await getRequestWithToken(),
      );
      List<NotificationsResponseModel> notifications =
          (response.data[ApiKeys.data][ApiKeys.result] as List)
              .map<NotificationsResponseModel>((json) => NotificationsResponseModel.fromMap(json))
              .toList();

      result = ApiResponse.completed(notifications);
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
