import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/data/data_source/category_services_provider/category_services_api.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

// category Services api call implementation
class CategoryServicesApiImp extends BaseApiProvider
    implements CategoryServicesApi {
  @override
  Future<ApiResponse<List<CategoryServiceModel>>> getServices(
      {required String id}) async {
    ApiResponse<List<CategoryServiceModel>>? result;
    Response? response;
    try {
      response = await client.get(
        '${Urls.categoryServices}/$id',
        options: await getRequestWithTokenIfAvailable(),
      );
      List<CategoryServiceModel> services =
          (response.data[ApiKeys.data][ApiKeys.result] as List)
              .map<CategoryServiceModel>(
                  (json) => CategoryServiceModel.fromMap(json))
              .toList();

      result = ApiResponse.completed(services);
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
