import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/easer_home_repository.dart';
import '../data_source/upcoming_services_provider/upcoming_services_api_imp.dart';

// implementation Easer Home repository
class EaserHomeRepositoryImp implements EaserHomeRepository {
  final EaserUpcomingServicesApiImp _upcomingServicesApiImp;

  EaserHomeRepositoryImp(this._upcomingServicesApiImp);

  @override
  Future<Either<dynamic, ApiResponse<List<UpcomingOrdersModel>?>>>
      getUpcomingOrders({required DateTime date}) async {
    ApiResponse<List<UpcomingOrdersModel>?> result;
    try {
      result = await _upcomingServicesApiImp.getUpcomingServices(
        date: date,
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
