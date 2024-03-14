import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/easer_services_history_repository.dart';

// Get Easer Srevices History useCase repository
class GetEaserServicesHistoryUseCase extends UseCase<
    ApiResponse<List<HistoryOrdersModel>?>, EaserServicesHistoryUseCaseParams> {
  final EaserServicesHistoryRepository? _easerServicesHistoryRepository;

  GetEaserServicesHistoryUseCase(this._easerServicesHistoryRepository);

  @override
  Future<Either<dynamic, ApiResponse<List<HistoryOrdersModel>?>>> call(
      EaserServicesHistoryUseCaseParams params) {
    return _easerServicesHistoryRepository!.getServicesHistory(
        page: params.page, limit: params.limit, date: params.date);
  }
}

class EaserServicesHistoryUseCaseParams {
  final int? page;
  final int? limit;
  final DateTime? date;
  EaserServicesHistoryUseCaseParams({this.page, this.limit, this.date});
}
