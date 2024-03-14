
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../shared_models/category_service_model.dart';

// abstract get offers  api call
abstract class OffersApi {
  Future<ApiResponse<List<CategoryServiceModel>>> getOffers();
}
