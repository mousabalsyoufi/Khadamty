import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/data/data_source/categories_provider/user_categories_api.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

// categories api call implementation
class UserCategoriesApiImp extends BaseApiProvider
    implements UserCategoriesApi {
  @override
  Future<ApiResponse<List<CategoryModel>>> getCategories() async {
    ApiResponse<List<CategoryModel>>? result;
    Response? response;
    try {
      response = await client.get(
        Urls.categories,
        options: await getRequestWithToken(),
      );
      List<CategoryModel> categories =
          (response.data[ApiKeys.data][ApiKeys.result] as List)
              .map<CategoryModel>((json) => CategoryModel.fromMap(json))
              .toList();

      result = ApiResponse.completed(categories);
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
