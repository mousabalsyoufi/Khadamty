import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get category Services  api call
abstract class CategoryServicesApi {
  Future<ApiResponse<List<CategoryServiceModel>>> getServices({required String id});
}
