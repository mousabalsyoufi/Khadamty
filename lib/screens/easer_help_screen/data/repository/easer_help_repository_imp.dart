import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../domain/repoistory/easer_help_repository.dart';
import '../data_source/easer_faqs_provider/easer_faqs_api_imp.dart';

// implementation Easer Help repository
class EaserHelpRepositoryImp implements EaserHelpRepository {
  final EaserFaqsApiImp easerFaqsApiImp;

  EaserHelpRepositoryImp({
    required this.easerFaqsApiImp,
  });
  
  @override
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>> getEaserFaqs() async {
    ApiResponse<List<SharedFaqModel>> result;
    try {
      result = await easerFaqsApiImp.getEaserFaqs();
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
