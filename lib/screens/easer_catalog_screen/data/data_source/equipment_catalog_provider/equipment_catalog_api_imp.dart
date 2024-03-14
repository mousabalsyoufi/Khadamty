import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';
import 'equipment_catalog_api.dart';

// catalogs api call implementation
class EquipmentCatalogApiImp extends BaseApiProvider
    implements EquipmentCatalogApi {
  @override
  Future<ApiResponse<List<CatalogModel>>> getCatalogs() async {
    ApiResponse<List<CatalogModel>>? result;
    Response? response;
    try {
      response = await client.get(
        Urls.equipementCatalog,
        options: await getRequestWithToken(),
      );
      List<CatalogModel> catalogs =
          (response.data[ApiKeys.data][ApiKeys.result] as List)
              .map<CatalogModel>((json) => CatalogModel.fromMap(json))
              .toList();

      result = ApiResponse.completed(catalogs);
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
