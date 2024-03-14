import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/domain/repository/easer_services_history_repository.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../datasource/services_history_provider/easer_services_history_api_imp.dart';

// implementation Easer Services History repository
class EaserServicesHistoryRepositoryImp
    implements EaserServicesHistoryRepository {
  final EaserServicesHistoryApiImp _easerServicesHistoryApiImp;

  EaserServicesHistoryRepositoryImp(
    this._easerServicesHistoryApiImp,
  );

  @override
  Future<Either<dynamic, ApiResponse<List<HistoryOrdersModel>?>>>
      getServicesHistory({int? page,int? limit,DateTime? date}) async {
    ApiResponse<List<HistoryOrdersModel>?> result;
    try {
      result = await _easerServicesHistoryApiImp.getServicesHistory(
        date: date,
        page: page,
        limit: limit
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
