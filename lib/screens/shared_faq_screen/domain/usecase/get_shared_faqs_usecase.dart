// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/data/repository/shared_faqs_repository.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// get shared faqs useCase to link with instance from repository
class GetSharedFaqsUseCase
    extends UseCase<ApiResponse<List<SharedFaqModel>>, NoParams> {
  final SharedFaqsRepositoryImp? _sharedFaqsRepositoryImp;

  GetSharedFaqsUseCase(this._sharedFaqsRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>> call(
      NoParams params) {
    return _sharedFaqsRepositoryImp!.getSharedFaqs();
  }
}
