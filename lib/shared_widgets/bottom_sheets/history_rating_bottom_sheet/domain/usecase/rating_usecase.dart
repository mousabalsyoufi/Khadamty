import 'package:dartz/dartz.dart';

import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/generic_usecase/usecase.dart';
import '../../data/model/rating_request_model.dart';
import '../repository/rating_repository.dart';


// rating service useCase to link with instance from repository
class RatingUseCase
    extends UseCase<ApiResponse<String>, RatingUseCaseParams> {
  final RatingRepository? _ratingRepository;

  RatingUseCase(this._ratingRepository);

  @override
  Future<Either<dynamic, ApiResponse<String>>> call(
      RatingUseCaseParams params) {
    return _ratingRepository!.rateService(
      requestModel: params.requestModel,
    );
  }
}

class RatingUseCaseParams {
  final RatingRequestModel requestModel;
  RatingUseCaseParams({
    required this.requestModel,
  });
}
