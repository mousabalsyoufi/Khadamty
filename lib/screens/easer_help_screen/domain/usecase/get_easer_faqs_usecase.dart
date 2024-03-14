// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../../data/repository/easer_help_repository_imp.dart';

// get easer faqs useCase to link with instance from repository
class GetEaserFaqsUseCase
    extends UseCase<ApiResponse<List<SharedFaqModel>>, NoParams> {
  final EaserHelpRepositoryImp? _easerHelpRepositoryImp;

  GetEaserFaqsUseCase(this._easerHelpRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<List<SharedFaqModel>>>> call(
      NoParams params) {
    return _easerHelpRepositoryImp!.getEaserFaqs();
  }
}
