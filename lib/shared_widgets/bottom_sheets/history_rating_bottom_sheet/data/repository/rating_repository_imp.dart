import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/model/rating_request_model.dart';

import '../../../../../constants/enums/response_enum.dart';
import '../../domain/repository/rating_repository.dart';
import '../datasource/rating_provider/rating_api_imp.dart';

// implementation rating repository repository
class RatingRepositoryImp implements RatingRepository {
  final RatingApiImp _ratingApiImp;

  RatingRepositoryImp(this._ratingApiImp);

  @override
  Future<Either<dynamic, ApiResponse<String>>> rateService(
      {required RatingRequestModel requestModel}) async {
    ApiResponse<String> result;
    try {
      result = await _ratingApiImp.rateService(requestModel: requestModel);
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
