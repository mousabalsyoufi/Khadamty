import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/easer_home_repository.dart';

// Get upcoming Services useCase repository
class GetEaserUpcomingServicesUseCase extends UseCase<
    ApiResponse<List<UpcomingOrdersModel>?>, UpcomingServicesUseCaseParams> {
  final EaserHomeRepository? _easerHomeRepository;

  GetEaserUpcomingServicesUseCase(this._easerHomeRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<UpcomingOrdersModel>?>>> call(
      UpcomingServicesUseCaseParams params) {
    return _easerHomeRepository!.getUpcomingOrders(date: params.date);
  }
}

class UpcomingServicesUseCaseParams {
  final DateTime date;
  UpcomingServicesUseCaseParams({required this.date});
}
