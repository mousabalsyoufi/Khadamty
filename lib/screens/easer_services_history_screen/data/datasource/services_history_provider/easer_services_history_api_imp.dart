import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/data/datasource/services_history_provider/easer_services_history_api.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// GET easer services history api call implementation
class EaserServicesHistoryApiImp extends BaseApiProvider
    implements EaserServicesHistoryApi {
  @override
  Future<ApiResponse<List<HistoryOrdersModel>?>> getServicesHistory(
      {int? page, int? limit, DateTime? date}) async {
    ApiResponse<List<HistoryOrdersModel>?>? result;
    Response? response;
    try {
      Options options = await getRequestWithToken();
      
      //set query params ....
      Map<String,dynamic> queryParameters ={'limit':limit,'page':page};
      // add date if you find it as query
      if(date != null){
        queryParameters['date'] = date.yyyyMMdd();
      }

      response = await client.get(Urls.historyOrders,
          options: options, queryParameters: queryParameters);
      var list = response.data[ApiKeys.data][ApiKeys.result]
          .map<HistoryOrdersModel>((json) => HistoryOrdersModel.fromJson(json))
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
