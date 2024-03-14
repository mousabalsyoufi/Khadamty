import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import '../../../../constants/enums/response_enum.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/user_offer_reservation_details_repository.dart';
import '../data_source/offer_reservation_details_provider/offer_reservation_details_api_imp.dart';

// implementation User Upcoming Offer Details repository
class UserOfferReservationDetailsRepositoryImp
    implements UserOfferReservationDetailsRepository {
  final OfferReservationDetailsApiImp offerReservationDetailsApiImp;

  UserOfferReservationDetailsRepositoryImp({
    required this.offerReservationDetailsApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getUpcomingOfferDetails({required String id}) async {
    ApiResponse<ServiceReservationDetailsModel> result;
    try {
      result = await offerReservationDetailsApiImp.getOfferReservationDetails(
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
