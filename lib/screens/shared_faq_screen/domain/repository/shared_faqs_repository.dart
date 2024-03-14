import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract class for user shared faqs Repository
abstract class SharedFaqsRepository {
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>> getSharedFaqs();
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>> getSharedFaqItems(
      {required int id});
}
