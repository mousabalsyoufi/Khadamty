// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/repository/shared_faqs_repository.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// get shared faq items useCase to link with instance from repository
class GetSharedFaqItemsUseCase
    extends UseCase<ApiResponse<List<SharedFaqModel>>, SharedFaqItemsParams> {
  final SharedFaqsRepositoryImp? _sharedFaqsRepositoryImp;

  GetSharedFaqItemsUseCase(this._sharedFaqsRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>> call(
      SharedFaqItemsParams params) {
    return _sharedFaqsRepositoryImp!.getSharedFaqItems(id: params.id);
  }
}

class SharedFaqItemsParams {
  int id;
  SharedFaqItemsParams({required this.id});
}
