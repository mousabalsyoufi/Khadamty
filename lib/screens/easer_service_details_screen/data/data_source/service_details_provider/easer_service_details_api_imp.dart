import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import 'easer_service_details_api.dart';

// Easer Service Details api call implementation
class EaserServiceDetailsApiImp extends BaseApiProvider
    implements EaserServiceDetailsApi {
  @override
  Future<ApiResponse<ServiceReservationDetailsModel>> getServiceDetails(
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
