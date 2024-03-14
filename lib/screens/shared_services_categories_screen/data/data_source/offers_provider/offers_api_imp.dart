import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/data_source/offers_provider/offers_api.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

// offers api call implementation
class OffersApiImp extends BaseApiProvider implements OffersApi {
  @override
  Future<ApiResponse<List<CategoryServiceModel>>> getOffers() async {
    ApiResponse<List<CategoryServiceModel>>? result;
    Response? response;
    try {
      response = await client.get(
        Urls.offers,
        options: await getRequestWithTokenIfAvailable(),
      );
      List<CategoryServiceModel> offers =
          (response.data[ApiKeys.data][ApiKeys.result] as List)
              .map<CategoryServiceModel>(
                  (json) => CategoryServiceModel.fromMap(json, isOffer: true))
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
