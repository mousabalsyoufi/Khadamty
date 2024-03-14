import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import '../../../../constants/enums/response_enum.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/easer_service_details_repository.dart';
import '../data_source/service_details_provider/easer_service_details_api_imp.dart';

// implementation Easer Service Details repository
class EaserServiceDetailsRepositoryImp
    implements EaserServiceDetailsRepository {
  final EaserServiceDetailsApiImp easerServiceDetailsApiImp;

  EaserServiceDetailsRepositoryImp({
    required this.easerServiceDetailsApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getServiceDetails({required String id}) async {
    ApiResponse<ServiceReservationDetailsModel> result;
    try {
      result = await easerServiceDetailsApiImp.getServiceDetails(
        id: id,
      );
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
