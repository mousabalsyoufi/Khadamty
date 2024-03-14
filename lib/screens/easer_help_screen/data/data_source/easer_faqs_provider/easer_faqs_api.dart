import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get easer faqs api call
abstract class EaserFaqsApi {
  Future<ApiResponse<List<SharedFaqModel>>> getEaserFaqs();
}
