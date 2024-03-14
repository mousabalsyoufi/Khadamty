import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import '../../../../constants/enums/response_enum.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/service_history_details_repository.dart';
import '../datasource/service_history_details_provider/service_history_details_api_imp.dart';

// implementation User Upcoming Offer Details repository
class ServiceHistoryDetailsRepositoryImp
    implements ServiceHistoryDetailsRepository {
  final ServiceHistoryDetailsApiImp serviceHistoryDetailsApiImp;

  ServiceHistoryDetailsRepositoryImp({
    required this.serviceHistoryDetailsApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getServiceHistoryDetails({required String id}) async {
    ApiResponse<ServiceReservationDetailsModel> result;
    try {
      result = await serviceHistoryDetailsApiImp.getServiceHistoryDetails(
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
