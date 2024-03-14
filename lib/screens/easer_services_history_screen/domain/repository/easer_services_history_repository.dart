import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for Easer Services History Repository
abstract class EaserServicesHistoryRepository {
  Future<Either<dynamic, ApiResponse<List<HistoryOrdersModel>?>>>
      getServicesHistory({int? page,int? limit,DateTime? date});
}
