import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/data_source/upcoming_orders_provider/upcoming_orders_api.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import '../../../../../constants/api_keys/api_keys.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// upcoming orders api call implementation
class UpcomingOrdersApiImp extends BaseApiProvider implements UpcomingOrdersApi {
  @override
  Future<ApiResponse<List<UpcomingOrdersModel>?>> upcomingOrders({int? page, int? limit, DateTime? date}) async{

    ApiResponse<List<UpcomingOrdersModel>?>? result;
    Response? response;
    try {

      //set query params ....
      Map<String,dynamic> queryParameters ={'limit':limit,'page':page};
      // add date if you find it as query
      if(date != null){
       queryParameters['date'] = date.yyyyMMdd();
      }


      Options options = await getRequestWithToken();

      response = await client.get(
        Urls.upcomingOrders,
        options:options,
        queryParameters: queryParameters
      );



     var list  = response.data[ApiKeys.data][ApiKeys.result].map<UpcomingOrdersModel>((json) => UpcomingOrdersModel.fromJson(json)).toList();

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
