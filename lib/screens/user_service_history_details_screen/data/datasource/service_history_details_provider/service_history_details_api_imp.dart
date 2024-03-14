import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/user_service_history_details_screen/data/datasource/service_history_details_provider/service_history_details_api.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// service history Details api call implementation
class ServiceHistoryDetailsApiImp extends BaseApiProvider
    implements ServiceHistoryDetailsApi {

  @override
  Future<ApiResponse<ServiceReservationDetailsModel>> getServiceHistoryDetails(
      {required String id}) async {
    ApiResponse<ServiceReservationDetailsModel>? result;
    Response? response;
    try {
      final params = {'contactList': 1};
      response = await client.get(
          '${Urls.serviceAndOfferReservationDetails}/$id',
          options: await getRequestWithToken(),
          queryParameters: params);
      result = ApiResponse.completed(ServiceReservationDetailsModel.fromMap(
          response.data[ApiKeys.data][ApiKeys.result]));
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
