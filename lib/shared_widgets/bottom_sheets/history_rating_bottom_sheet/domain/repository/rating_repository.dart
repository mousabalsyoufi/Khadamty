import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/model/rating_request_model.dart';
import '../../../../../core/api_handler/response_handler.dart';

// abstract class for Rating Service Repository
abstract class RatingRepository {
  Future<Either<dynamic, ApiResponse<String>>> rateService({
    required RatingRequestModel requestModel,
  });
}
