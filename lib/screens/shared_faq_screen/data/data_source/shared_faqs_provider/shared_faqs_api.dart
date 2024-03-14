import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get shared faq for user and guest  api call
abstract class SharedFaqsApi {
  Future<ApiResponse<List<SharedFaqModel>>> getSharedFaqs();
}
