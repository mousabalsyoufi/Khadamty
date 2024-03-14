import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/data_source/offer_details_provider/offer_details_api.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

// offer details api call implementation
class OfferDetailsApiImp extends BaseApiProvider implements OfferDetailsApi {
  @override
  Future<ApiResponse<List<OfferDetailsModel>>> getOfferDdetails(
      {required String id}) async {
    ApiResponse<List<OfferDetailsModel>>? result;
    Response? response;
    try {
      response = await client.get(
        '${Urls.offerDetails}/$id',
        options: await getRequestWithToken(),
      );
      List<OfferDetailsModel> offers =
          (response.data[ApiKeys.data][ApiKeys.result] as List)
              .map<OfferDetailsModel>((json) => OfferDetailsModel.fromMap(json))
              .toList();

      result = ApiResponse.completed(offers);
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
