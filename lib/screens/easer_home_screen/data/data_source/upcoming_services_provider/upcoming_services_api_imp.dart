import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/data/data_source/upcoming_services_provider/upcoming_services_api.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

/// upcoming services api call implementation
class EaserUpcomingServicesApiImp extends BaseApiProvider
    implements EaserUpcomingServicesApi {
  @override
  Future<ApiResponse<List<UpcomingOrdersModel>?>> getUpcomingServices(
      {required DateTime date}) async {
    ApiResponse<List<UpcomingOrdersModel>?>? result;
    Response? response;
    try {
      Map<String, dynamic> queryParameters = {};
      queryParameters['date'] = date.yyyyMMdd();

      Options options = await getRequestWithToken();

      response = await client.get(Urls.easerUpcomingOrders,
          options: options, queryParameters: queryParameters);

      var list = response.data[ApiKeys.data][ApiKeys.result]
          .map<UpcomingOrdersModel>(
              (json) => UpcomingOrdersModel.fromJson(json))
          .toList();

      result = ApiResponse.completed(list);
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
