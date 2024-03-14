import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract class for Easer Help Repository
abstract class EaserHelpRepository {
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>> getEaserFaqs();
  
}
