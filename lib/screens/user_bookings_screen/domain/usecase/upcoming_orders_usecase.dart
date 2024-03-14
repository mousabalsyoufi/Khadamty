import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/repository/user_bookings_repository.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// Get upcoming Orders useCase repository
class UpcomingOrdersUseCase extends UseCase<ApiResponse<List<UpcomingOrdersModel>?>, UpcomingOrdersUseCaseParams> {
  final UserBookingsRepository? _userBookingsRepository;

  UpcomingOrdersUseCase(this._userBookingsRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<UpcomingOrdersModel>?>>> call(
      UpcomingOrdersUseCaseParams params) {
    return _userBookingsRepository!.upcomingOrders(page: params.page,limit: params.limit,date: params.date);
  }
}

class UpcomingOrdersUseCaseParams {
  final int? page;
  final int? limit;
  final DateTime? date;
  UpcomingOrdersUseCaseParams({this.page,this.limit,this.date});
}
