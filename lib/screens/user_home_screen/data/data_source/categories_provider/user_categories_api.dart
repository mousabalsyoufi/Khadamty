import 'package:faciltateur_de_vies/shared_models/category_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get categories  api call
abstract class UserCategoriesApi {
  Future<ApiResponse<List<CategoryModel>>> getCategories();
}
