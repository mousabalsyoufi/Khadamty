import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/data_source/shared_faq_items_provieder/shared_faq_items_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/data_source/shared_faqs_provider/shared_faqs_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/domain/repository/shared_faqs_repository.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

// implementation shared faqs repository
class SharedFaqsRepositoryImp implements SharedFaqsRepository {
  final SharedFaqsApiImp sharedFaqsApiImp;
  final SharedFaqItemsApiImp sharedFaqItemsApiImp;

  SharedFaqsRepositoryImp({
    required this.sharedFaqsApiImp,
    required this.sharedFaqItemsApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>>
      getSharedFaqs() async {
    ApiResponse<List<SharedFaqModel>> result;
    try {
      result = await sharedFaqsApiImp.getSharedFaqs();
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>> getSharedFaqItems(
      {required int id}) async {
    ApiResponse<List<SharedFaqModel>> result;
    try {
      result = await sharedFaqItemsApiImp.getSharedFaqItems(id: id);
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
