import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/domain/repository/user_bookings_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// Get History Orders useCase repository
class HistoryOrdersUseCase extends UseCase<ApiResponse<List<HistoryOrdersModel>?>, HistoryOrdersUseCaseParams> {
  final UserBookingsRepository? _userBookingsRepository;

  HistoryOrdersUseCase(this._userBookingsRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<HistoryOrdersModel>?>>> call(HistoryOrdersUseCaseParams params) {
    return _userBookingsRepository!.historyOrders(page: params.page,limit: params.limit,date: params.date);
  }
}

class HistoryOrdersUseCaseParams {
  final int? page;
  final int? limit;
  final DateTime? date;
  HistoryOrdersUseCaseParams({this.page,this.limit,this.date});
}
